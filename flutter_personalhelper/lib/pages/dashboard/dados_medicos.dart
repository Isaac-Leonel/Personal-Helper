// ignore_for_file: avoid_print
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:personal_helper/components/controleidoso.dart';

import 'package:personal_helper/components/profilebar.dart';

class dados extends StatelessWidget {
  const dados({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32A18A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: const Color(0xFF00261d),
                height: 100,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const ProfileBar(
                        exibirSaud: true,
                        exibirBack: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FloatingActionButton(
                    heroTag: "btn2",
                    child: const Icon(Icons.arrow_downward),
                    backgroundColor: const Color(0xFF32A18A),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/dashboard');
                    }),

                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Novos Dados',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: const Text(
                    'Encaminhar novos dados medicos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text(
                  'Escolha abaixo qual tipo deseja enviar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                // ignore: prefer_const_constructors
                Controle(
                  alertName: 'Medição de pressão arterial',
                  hero: 'btn1',
                  rota: '/instrucoesdadosPressao',
                ),
                Controle(
                  alertName: 'Medidor de glicemia',
                  hero: 'btn2',
                  rota: '/instrucoesdadosPressao',
                ),
                Controle(
                  alertName: 'Termometro clinico',
                  hero: 'btn3',
                  rota: '/instrucoesdadosPressao',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
