// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/DashboardCuida.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/RelatorioGlicemia.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/RelatorioPressao.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/RelatorioTemperatura.dart';
import 'package:personal_helper/pages/cuidador/components/profilebarCuida.dart';

class Relatorio extends StatelessWidget {
  const Relatorio({Key? key}) : super(key: key);
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
                height: 169,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const ProfileBarCuida(
                        exibirSaud: true,
                        exibirBack: true,
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
                    heroTag: "btn1",
                    child: const Icon(Icons.arrow_downward),
                    backgroundColor: const Color(0xFF32A18A),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => DashboardCuidador()));
                    }),

                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'RELATÓRIOS',
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
                    'Escolha qual categoria de relatório deseja gerar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, bottom: 10, top: 30),
                  child: Container(
                    height: 65,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFF00261D),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF32A18A), spreadRadius: 3),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Histórico de Pressão arterial",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FloatingActionButton(
                              heroTag: "btn4",
                              child: Icon(Icons.add_a_photo),
                              backgroundColor: const Color(0xFF32A18A),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => RelatorioPressao()));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, bottom: 10, top: 30),
                  child: Container(
                    height: 65,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFF00261D),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF32A18A), spreadRadius: 3),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Histórico de medição de Glicemia",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FloatingActionButton(
                              heroTag: "btn2",
                              child: Icon(Icons.add_a_photo),
                              backgroundColor: const Color(0xFF32A18A),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => RelatorioGlicemia()));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, bottom: 10, top: 30),
                  child: Container(
                    height: 65,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFF00261D),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF32A18A), spreadRadius: 3),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Histórico de Temperatura",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FloatingActionButton(
                              heroTag: "btn3",
                              child: Icon(Icons.add_a_photo),
                              backgroundColor: const Color(0xFF32A18A),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => RelatorioTemperatura()));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
              ],
            )
          ],
        ),
      ),
    );
  }
}
