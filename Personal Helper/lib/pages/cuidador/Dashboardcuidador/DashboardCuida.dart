import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/pages/cuidador/components/horarioalertacuida.dart';
import 'package:personal_helper/pages/cuidador/components/moduleCardCalendarioCuida.dart';
import 'package:personal_helper/pages/cuidador/components/modulecardCuida.dart';
import 'package:personal_helper/pages/cuidador/components/profilebarCuida.dart';
import 'package:personal_helper/pages/cuidador/components/snackbarCuida.dart';

String getDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('HH:mm').format(now);

  return formattedDate;
}

class DashboardCuidador extends StatefulWidget {
  DashboardCuidador({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardCuidador> createState() => _DashboardCuidador();
}

class _DashboardCuidador extends State<DashboardCuidador> {
  // Get the time
  @override
  void initState() {
    getDate();

    super.initState();
  }

  final String horarioS = "O horario atual é: " + getDate();
  final String horario = getDate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Container(
                color: const Color(0xFF00261d),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: ProfileBarCuida(
                        exibirSaud: true,
                        exibirBack: false,
                      ),
                    ),
                    Center(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          HorarioAlertaCuida(
                              alertName: 'Consulta Marcada (22/05) às 11:35',
                              levelWarning: 3,
                              alertTime: '17:00'),
                          const HorarioAlertaCuida(
                              alertName: 'Pedro possui uma medicação em atraso',
                              levelWarning: 3,
                              alertTime: '17:00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 365,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/backgrounddash.png"),
                    fit: BoxFit.cover),
              ),
              // ignore: prefer_const_literals_to_create_immutables
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(

                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ModuleCardCuida(
                                iconModule: 'assets/img/caixamenor.png',
                                textModule: 'Caixa de Remédio'),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ModuleCardCalendarioCuida(
                                iconModule: 'assets/img/calendario.png',
                                textModule: 'Calendário'),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            SnackIdosoCuida(),
          ],
        ),
      ),
    );
  }
}
