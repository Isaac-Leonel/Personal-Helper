import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/tela_confirma%C3%A7%C3%A3o.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;

import '../main.dart';

class SalvarRemedioForm extends StatelessWidget {
  const SalvarRemedioForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final dosageController = TextEditingController();
    final descController = TextEditingController();
    final totalController = TextEditingController();
    final atualController = TextEditingController();

    var idosoAPI = ngrok.idoso;
    var cuidadorAPI = ngrok.cuidador;
    var medicamentoAPI = ngrok.remedios;

    printErro(String erro) {
      return showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Falha ao salvar!'),
                content: Text(erro),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }

    Future<String> postIdoso() async {
      HttpOverrides.global = MyHttpOverrides();
      final prefs = await SharedPreferences.getInstance();
      String? value = prefs.getString("cpf");
      final response =
          await http.post(Uri.parse('${medicamentoAPI}/api/ph/medicament/save'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "name": nomeController.text,
                "description": descController.text,
                "dosage": dosageController.text,
                "cpf": "${value}",
                "totalAmount": totalController.text,
                "currentAmount": atualController.text
              }));
      var body = json.decode(response.body);
      print(body);
      if (response.statusCode != 200 || response.body.contains("Erro")) {
        printErro(body);
        return body;
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TelaConfirmacao(
                      mensagem: 'REMEDIO',
                      rota: true,
                    )));
        return body;
      }
    }

    return SingleChildScrollView(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: Container(
              color: const Color(0xFF00261d),
              height: 200,
              child: Column(
                children: [
                  ProfileBar(
                    exibirSaud: false,
                    exibirBack: true,
                  ),
                  SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/img/remedio.png',
                      )),
                  Column(
                    children: [
                      Text(
                        'Remédio',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  'Nome',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  'Dosagem',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: dosageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  'Descrição',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: descController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  'Quantidade de Comprimidos',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: totalController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  'Quantidade Atual de Comprimidos',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: atualController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                child: Icon(Icons.task_alt),
                backgroundColor: const Color(0xFF32A18A),
                onPressed: () {
                  postIdoso();
                }),
          ),
        ],
      ),
    );
  }
}
