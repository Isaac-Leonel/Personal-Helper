import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/form_salvarlembrete.dart';
import '../../components/profilebar.dart';

class AdicionarLembrete extends StatefulWidget {
  @override
  State<AdicionarLembrete> createState() => _AdicionarLembrete();
}

class _AdicionarLembrete extends State<AdicionarLembrete> {
  var idosoAPI = ngrok.idoso;
  var cuidadorAPI = ngrok.cuidador;
  var token;

  bool qrTrue = false;

  fetchGetUserByCpf() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http
        .get(Uri.parse('${idosoAPI}/api/ph/elderly/generate_token/${value}'));
    if (response.statusCode == 200) {
      print(response.body);
      token = response.body;
      qrTrue = true;
      setState(() {});
      return response.body;
    } else {
      throw Exception('Failed to load Idoso');
    }
  }

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
                // ignore: prefer_const_literals_to_create_immutables
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
                  heroTag: 'btn14',
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
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'NOVO LEMBRETE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SalvarLembrete()
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
