// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/inputcads.dart';
import '../components/inputcadmin.dart';
import '../components/inputcadminr.dart';

class Edita extends StatelessWidget {
  const Edita({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF237C6A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF00261d),
              height: 280,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 350, top: 30),
                    child: SizedBox(
                        child: Image.asset(
                      'assets/img/config.png',
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: SizedBox(
                      child: Image.asset(
                        'assets/img/arrow.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 350),
                    child: SizedBox(
                      child: Image.asset(
                        'assets/img/senhor.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 134, top: 5, right: 134),
                    child: SizedBox(
                      child: Image.asset(
                        'assets/img/remedio.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 134, top: 10, right: 134, bottom: 40),
                    child: Text(
                      'Paracetamol',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const InputCadLarg(
                    inputname: 'Descricao',
                  ),
                  const InputCadmin(
                    inputname: 'Quantidade',
                  ),
                  const InputCadminr(
                    inputname: 'Vencimento',
                  ),
                  const InputCadmin(
                    inputname:
                        'Horario de                                                        administração',
                  ),
                  const InputCadminr(
                    inputname: 'Horario de administração 2',
                  ),
                  const InputCadmin(
                    inputname: 'função',
                  ),
                  const InputCadminr(
                    inputname: 'Tarja',
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
    );
  }
}
