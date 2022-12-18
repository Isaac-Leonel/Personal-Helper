import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/components/horarioalerta.dart';
import 'package:personal_helper/components/moduleCardCalendario.dart';
import 'package:personal_helper/components/moduleCardCartao.dart';
import 'package:personal_helper/components/modulecard.dart';
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/snackbar.dart';
import 'package:personal_helper/models/lembrete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:http/http.dart' as http;

String getDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('HH:mm').format(now);

  return formattedDate;
}

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String horarioS = "O horario atual é: " + getDate();
  final String horario = getDate();

  var lembrete = <Lembrete>[];

  var alertaAPI = ngrok.alertas;

  /*Future fetchGetLembrete() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http.get(Uri.parse(
        '${alertaAPI}/api/ph/reminder/fetch_allr_reminders_three/${value}'));
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
  }*/

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    getDate();
  //  _getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: const Color(0xFF00261d),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ProfileBar(
                      exibirSaud: true,
                      exibirBack: false,
                    ),
                  ),
                  Center(
                    child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            horarioS,
                            style: TextStyle(color: Colors.white),
                          ),
                          // ignore: prefer_const_constructors
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
                                        DateTime.parse(
                                            lembrete[index].dateRemider)));
                              }),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              height: 365,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/backgrounddash.png"),
                    fit: BoxFit.cover),
              ),
              // ignore: prefer_const_literals_to_create_immutables
              child: Center(
                child: Wrap(

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ModuleCard(
                            iconModule: 'assets/img/caixaderemedio.png',
                            textModule: 'Caixa de Remédio'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ModuleCardCalendario(
                            iconModule: 'assets/img/calendario.png',
                            textModule: 'Calendário'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ModuleCardCartao(
                            iconModule: 'assets/img/cartao.png',
                            textModule: 'Cartão Saúde'),
                      ),
                    ]),
              ),
            ),
            SnackIdoso(),
          ],
        ),
      ),
    );
  }
}
