import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/models/idoso.dart';
import 'package:personal_helper/pages/cuidador/components/profilebar_cui.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/pages/cuidador/linkaridoso.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/idosomod.dart';

class SelectIdoso extends StatefulWidget {
  @override
  State<SelectIdoso> createState() => _SelectIdosoState();
}

class _SelectIdosoState extends State<SelectIdoso> {
  var idosos = <Idoso>[];

  var idosoAPI = ngrok.idoso;
  var cuidadorAPI = ngrok.cuidador;
  var medicamentoAPI = ngrok.remedios;

  Future fetchGetUserByCpf() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cuidador");
    print(value);
    final response = await http.get(Uri.parse(
        '${cuidadorAPI}/api/ph/caregiver/look_for_elderly_by_caregiver/${value}'));
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      print("Sem Idosos linkados");
    }
  }

  _getUsers() {
    fetchGetUserByCpf().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        idosos = list.map((model) => Idoso.fromJson(model)).toList();
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
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ProfileBarCuidador(exibirSaud: true, exibirBack: false),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: const Text(
                'CONTAS',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            // ignore: prefer_const_constructors
            const Text('Qual conta deseja gerenciar',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18)),
            GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: idosos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: IdosoModulo(
                      nome: idosos[index].name,
                      cpf: idosos[index].cpf,
                    ),
                  );
                }),
            FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: const Color(0xFF32A18A),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LinkarIdoso()));
                }),
          ],
        ),
      ),
    );
  }
}
