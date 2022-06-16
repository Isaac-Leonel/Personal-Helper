//import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/models/idoso.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartaoSaude extends StatefulWidget {
  const CartaoSaude({Key? key}) : super(key: key);

  @override
  State<CartaoSaude> createState() => _CartaoSaudeState();
}

class _CartaoSaudeState extends State<CartaoSaude> {
  late Future<Idoso> futureIdoso;
  var idosoAPI = ngrok.idoso;
  var cuidadorAPI = ngrok.cuidador;

  Future<Idoso> fetchGetUserByCpf() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http
        .get(Uri.parse('${idosoAPI}/api/ph/elderly/card_data/${value}'));
    print(response.body);
    if (response.statusCode == 200) {
      return Idoso.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Idoso');
    }
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    futureIdoso = fetchGetUserByCpf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(50, 161, 138, 1),
        body: Row(
          children: [
            Container(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      radius: 70,
                      foregroundColor: Color.fromRGBO(0, 153, 102, 1),
                      child: Image.asset('assets/img/perfil.png'),
                    ),
                  ),
                  FutureBuilder<Idoso>(
                      future: futureIdoso,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.name,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Text('');
                      }),
                ],
              ),
            ),
            Container(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'INFORMAÇÕES GERAIS',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          FutureBuilder<Idoso>(
                              future: futureIdoso,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Text(
                                      'CPF: ' + snapshot.data!.cpf,
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return Text('');
                              }),
                          FutureBuilder<Idoso>(
                              future: futureIdoso,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Text(
                                      'RG: ' + snapshot.data!.rg,
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return Text('');
                              }),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        FutureBuilder<Idoso>(
                            future: futureIdoso,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    'DATA DE NASCIMENTO: ' +
                                        snapshot.data!.birthday,
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return Text('');
                            }),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Text(
                            'CONTATOS DE EMERGÊNCIA',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          FutureBuilder<Idoso>(
                              future: futureIdoso,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Text(
                                      'Cuidador: ' + snapshot.data!.caregiver,
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return Text('');
                              }),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Contato emergência: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        FutureBuilder<Idoso>(
                            future: futureIdoso,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    snapshot.data!.emergencycontact,
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return Text('');
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.home),
                heroTag: 'btn6',
                backgroundColor: const Color(0xFF00261d),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Dashboard()));
                }),
          ],
        ));
  }
}
