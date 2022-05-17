import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../components/inputcad.dart';

class Logon extends StatelessWidget {
  const Logon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/logomini.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Text(
                'CADASTRO',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const Text(
                'IDOSO',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              SingleChildScrollView(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const InputCad(
                      inputname: 'Nome Completo',
                    ),
                    const InputCad(
                      inputname: 'CPF',
                    ),
                    const InputCad(
                      inputname: 'RG',
                    ),
                    const InputCad(
                      inputname: 'Data de Nascimento',
                    ),
                    const InputCad(
                      inputname: 'Email',
                    ),
                    const InputCad(
                      inputname: 'Senha',
                    ),
                    const InputCad(
                      inputname: 'Confirmar Senha',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                    child: Icon(Icons.task_alt),
                    backgroundColor: const Color(0xFF32A18A),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
