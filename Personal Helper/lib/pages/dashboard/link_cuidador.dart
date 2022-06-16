import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/profilebar.dart';

class LinkCuidador extends StatefulWidget {
  @override
  State<LinkCuidador> createState() => _LinkCuidadorState();
}

class _LinkCuidadorState extends State<LinkCuidador> {
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Dashboard()));
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
                      'CUIDADOR',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  qrTrue
                      ? QrImage(
                          data: token,
                          version: QrVersions.auto,
                          size: 220,
                        )
                      : Text(""),
                  const Text(
                    'CÓDIGO VERIFICADOR',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                          token ?? ' ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ButtonTheme(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () => {fetchGetUserByCpf()},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00261d),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "GERAR CÓDIGO",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ), //RaisedButtons
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
