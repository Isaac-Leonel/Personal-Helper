// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/modulecardRemedio.dart';

class caixaRemedio extends StatelessWidget {
  const caixaRemedio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ModuleCard(
                      textModule: "PARACETAMOL",
                      iconModule: 'assets/img/remedio.png',
                      textModule1: "Comprimidos",
                      textModule2: "50 | 100",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(180.0),
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
