// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:personal_helper/components/profilebar.dart';
import '../components/inputcad.dart';
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
              height: 200,
              child: Column(
                children: [
                  ProfileBar(),
                  SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/img/remedio.png',
                      )),
                  Row(
                    children: [
                      Text(
                        'Nome Remedio',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Icon(
                        Icons.create_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const InputCadLarg(inputname: 'Descriçao'),
                const InputCad(inputname: 'Quantidade'),
                const InputCad(inputname: 'Vencimento'),
                const InputCad(inputname: 'Horario de Administração'),
                const InputCad(inputname: 'Horario de Administração 2'),
                const InputCad(inputname: 'Função'),
                const InputCad(inputname: 'Tarja'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
