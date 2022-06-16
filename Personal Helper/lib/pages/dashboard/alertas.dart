import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/components/horarioalerta.dart';
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/snackbar.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/pages/dashboard/adicionarLembrete.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/lembrete.dart';

String getDate() {
  initializeDateFormatting('pt_br', null);
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('hh:mm').format(now);
  return formattedDate;
}

class Alertas extends StatefulWidget {
  const Alertas({Key? key}) : super(key: key);

  @override
  State<Alertas> createState() => _AlertasState();
}

class _AlertasState extends State<Alertas> {
  final String horarioS = "O horario atual é: " + getDate();
  final String horario = getDate();

  var lembrete = <Lembrete>[];

  var alertaAPI = ngrok.alertas;

  Future fetchGetLembrete() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http.get(Uri.parse(
        '${alertaAPI}/api/ph/reminder/fetch_allr_reminders/${value}'));
    print(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load Idoso');
    }
  }

  _getUsers() {
    fetchGetLembrete().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        lembrete = list.map((model) => Lembrete.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    getDate();
    _getUsers();
    super.initState();
  }

  bool enable = false;

  final String horario_atual = getDate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 161, 138, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              color: const Color(0xFF00261d),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ProfileBar(exibirSaud: true, exibirBack: false),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              FloatingActionButton(
                  child: const Icon(Icons.arrow_downward),
                  backgroundColor: const Color(0xFF32A18A),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Dashboard()),
                    );
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'LEMBRETES',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lembrete.length,
                      itemBuilder: (context, index) {
                        return HorarioAlerta(
                            alertName: lembrete[index].name,
                            levelWarning: 3,
                            alertIcon: 'assets/img/remedio1.png',
                            alertTime: DateFormat('HH:mm').format(
                                DateTime.parse(lembrete[index].dateRemider)));
                      }),
                  FloatingActionButton(
                      child: Icon(Icons.add),
                      heroTag: 'btn6',
                      backgroundColor: const Color(0xFF00261d),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => AdicionarLembrete()),
                        );
                      }),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
