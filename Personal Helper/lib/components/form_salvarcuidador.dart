import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/components/tela_confirma%C3%A7%C3%A3o.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;

import '../main.dart';

class SalvarCuidadorForm extends StatelessWidget {
  const SalvarCuidadorForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final cpfController = TextEditingController();
    final loginController = TextEditingController();
    final dataController = TextEditingController();
    final escolaridadeController = TextEditingController();
    final senhaController = TextEditingController();
    final complementController = TextEditingController();
    final ruaController = TextEditingController();
    final bairroController = TextEditingController();
    final cidadeController = TextEditingController();
    final numeroController = TextEditingController();
    final confirmarSenhaController = TextEditingController();
    var idosoAPI = ngrok.idoso;
    var cuidadorAPI = ngrok.cuidador;

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
      final response =
          await http.post(Uri.parse('${cuidadorAPI}/api/ph/caregiver/save'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "name": nomeController.text,
                "cpf": cpfController.text,
                "birthday": dataController.text,
                "login": loginController.text,
                "Schooling": escolaridadeController.text,
                "password": senhaController.text,
                "complement": complementController.text,
                "street": ruaController.text,
                "neighborhood": bairroController.text,
                "city": cidadeController.text,
                "number": numeroController.text
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
                      mensagem: 'CUIDADOR',
                      rota: false,
                    )));
        return body;
      }
    }

    enviarFormulario(
      String password,
      String confSenha,
    ) async {
      if (password == confSenha) {
        postIdoso();
      } else {
        print("As senhas não correspondem");
      }
    }

    return SingleChildScrollView(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
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
                  'E-mail',
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
                    controller: loginController,
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
                  'Escolaridade',
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
                    controller: escolaridadeController,
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
                  'Data de Aniversário',
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
                    controller: dataController,
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
                  'CPF',
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
                    controller: cpfController,
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
                  'Rua',
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
                    controller: ruaController,
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
                  'Complemento',
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
                    controller: complementController,
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
                  'Bairro',
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
                    controller: bairroController,
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
                  'Cidade',
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
                    controller: cidadeController,
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
                  'Número da Residência',
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
                    controller: numeroController,
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
                  'Senha',
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
                    controller: senhaController,
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
                  'Confirmar Senha',
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
                    controller: confirmarSenhaController,
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
                  enviarFormulario(
                      senhaController.text, confirmarSenhaController.text);
                }),
          ),
        ],
      ),
    );
  }
}
