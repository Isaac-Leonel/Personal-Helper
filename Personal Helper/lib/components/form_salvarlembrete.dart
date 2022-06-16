import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/components/tela_confirma%C3%A7%C3%A3o.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SalvarLembrete extends StatefulWidget {
  const SalvarLembrete({Key? key}) : super(key: key);

  @override
  State<SalvarLembrete> createState() => _SalvarLembrete();
}

class _SalvarLembrete extends State<SalvarLembrete> {
  late DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    final lembrete = TextEditingController();
    final desc = TextEditingController();
    final horario = TextEditingController();
    final data = TextEditingController();

    var lembreteAPI = ngrok.alertas;

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

    Future<String> postLembrete() async {
      HttpOverrides.global = MyHttpOverrides();
      final prefs = await SharedPreferences.getInstance();
      String? value = prefs.getString("cpf");
      print(data.text + " " + horario.text);
      final response =
          await http.post(Uri.parse('${lembreteAPI}/api/ph/reminder/save'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "cpfForReminder": "${value}",
                "name": lembrete.text,
                "description": desc.text,
                "dateRemider": "${data.text} ${horario.text}"
              }));
      var body = response.body;
      print(body);
      if (response.statusCode != 200 || response.body.contains("Erro")) {
        printErro(body);
        return body;
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TelaConfirmacao(
                      mensagem: 'LEMBRETE',
                      rota: true,
                    )));
        return body;
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  'Nome do Lembrete',
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
                    controller: lembrete,
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
                  'Descrição Lembrete',
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
                    controller: desc,
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
                  'Horario',
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
                    controller: horario,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Exemplo: 15:00'),
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
                  'DATA',
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
                    controller: data,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Exemplo: 01-01-2023'),
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
                  postLembrete();
                }),
          ),
        ],
      ),
    );
  }
}
