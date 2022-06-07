// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/models/idoso.dart';
import 'package:personal_helper/models/remedio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../components/modulecardRemedio.dart';

class caixaRemedio extends StatefulWidget {
  const caixaRemedio({Key? key}) : super(key: key);

  @override
  State<caixaRemedio> createState() => _caixaRemedioState();
}

class _caixaRemedioState extends State<caixaRemedio> {
  var remedios = <Remedio>[];

  Future fetchGetUserByCpf() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http.get(Uri.parse(
        'https://b951-2804-7f2-2789-3253-7007-7b01-7d45-1af0.sa.ngrok.io/api/ph/medicament/get_medicine/${value}'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load Idoso');
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
        child: Wrap(
          children: [
            Center(
              child: Container(
                color: const Color(0xFF237C6A),
                height: 200,
                child: Column(
                  children: [
                    // ignore: prefer_const_constructors
                    ProfileBar(
                      exibirSaud: false,
                      exibirBack: true,
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
                          'Caixa de Remedio',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: remedios.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ModuleCardRemedio(
                    textModule: remedios[index].name,
                    iconModule: 'assets/img/remedio.png',
                    textModule1: "Comprimidos",
                    textModule2: "50 | 100",
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 2.0,
              ),
            ),
            Center(
              child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: const Color(0xFF32A18A),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/edita_remedio');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
