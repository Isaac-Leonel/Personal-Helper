// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/models/remedio.dart';
import 'package:personal_helper/pages/dashboard/edita_remedio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/modulecardRemedio.dart';

class caixaRemedio extends StatefulWidget {
  const caixaRemedio({Key? key}) : super(key: key);

  @override
  State<caixaRemedio> createState() => _caixaRemedioState();
}

class _caixaRemedioState extends State<caixaRemedio> {
  var remedios = <Remedio>[];

  var idosoAPI = ngrok.idoso;
  var cuidadorAPI = ngrok.cuidador;
  var medicamentoAPI = ngrok.remedios;

  Future fetchGetUserByCpf() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http.get(
        Uri.parse('${medicamentoAPI}/api/ph/medicament/get_medicine/${value}'));
    if (response.statusCode == 200) {
      return response;
    } else {
      print("falhou");
    }
  }

  _getUsers() {
    fetchGetUserByCpf().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        remedios = list.map((model) => Remedio.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    _getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    color: const Color(0xFF237C6A),
                    height: 250,
                    child: Column(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: const ProfileBar(
                            exibirSaud: false,
                            exibirBack: true,
                          ),
                        ),
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              'assets/img/caixaderemedio.png',
                            )),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Caixa de Remédio',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: FloatingActionButton(
                                    child: Icon(Icons.add),
                                    backgroundColor: const Color(0xFF00261d),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => Edita()),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: remedios.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ModuleCardRemedio(
                            textModule: remedios[index].name,
                            iconModule: 'assets/img/remedio.png',
                            qtAtual: remedios[index].currentAmount,
                            qtTotal: remedios[index].totalAmount,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
