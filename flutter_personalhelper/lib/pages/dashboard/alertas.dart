import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/components/horarioalerta.dart';
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/snackbar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

String getDate() {
  initializeDateFormatting('pt_br', null);
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('hh:mm').format(now);
  return formattedDate;
}

class Alertas extends StatefulWidget {
  const Alertas({Key? key}) : super(key: key);

  @override
  State<Alertas> createState() => _AlertasState();
}

class _AlertasState extends State<Alertas> {
  bool enable = false;
  @override
  void initState() {
    getDate();
    super.initState();
  }

  final String horario_atual = getDate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 161, 138, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              color: const Color(0xFF00261d),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child:
                        const ProfileBar(exibirSaud: true, exibirBack: false),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              FloatingActionButton(
                  child: const Icon(Icons.arrow_downward),
                  backgroundColor: const Color(0xFF32A18A),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/dashboard');
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'TODOS OS ALERTAS PLANEJADOS',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: HorarioAlerta(
                        alertName: 'Beber Água',
                        levelWarning: 1,
                        alertIcon: 'assets/img/agua.png',
                        alertTime: '07:00'),
                  ),
                  HorarioAlerta(
                      alertName: 'Remédio Nutricional',
                      levelWarning: 3,
                      alertIcon: 'assets/img/remedio1.png',
                      alertTime: '07:15'),
                  HorarioAlerta(
                      alertName: 'Remédio Nutricional',
                      levelWarning: 3,
                      alertIcon: 'assets/img/remedio1.png',
                      alertTime: '07:35'),
                  HorarioAlerta(
                      alertName: 'Remédio Nutricional',
                      levelWarning: 3,
                      alertIcon: 'assets/img/remedio1.png',
                      alertTime: '08:00'),
                  HorarioAlerta(
                      alertName: 'Beber Água',
                      levelWarning: 1,
                      alertIcon: 'assets/img/agua.png',
                      alertTime: '08:10'),
                  HorarioAlerta(
                      alertName: 'Remédio Nutricional',
                      levelWarning: 3,
                      alertIcon: 'assets/img/remedio1.png',
                      alertTime: '08:50'),
                  HorarioAlerta(
                      alertName: 'Remédio Nutricional',
                      levelWarning: 3,
                      alertIcon: 'assets/img/remedio1.png',
                      alertTime: '10:00'),
                  HorarioAlerta(
                      alertName: 'Remédio Nutricional',
                      levelWarning: 3,
                      alertIcon: 'assets/img/remedio1.png',
                      alertTime: '15:00'),
                  HorarioAlerta(
                      alertName: 'Beber Água',
                      levelWarning: 1,
                      alertIcon: 'assets/img/agua.png',
                      alertTime: '20:50'),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
