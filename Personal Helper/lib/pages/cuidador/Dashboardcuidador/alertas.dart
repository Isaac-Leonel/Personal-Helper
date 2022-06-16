import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/components/horarioalerta.dart';
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/snackbar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/DashboardCuida.dart';
import 'package:personal_helper/pages/dashboard/adicionarLembrete.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';

class AlertasCui extends StatefulWidget {
  const AlertasCui({Key? key}) : super(key: key);

  @override
  State<AlertasCui> createState() => _AlertasCui();
}

class _AlertasCui extends State<AlertasCui> {
  bool enable = false;
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
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ProfileBar(exibirSaud: true, exibirBack: false),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DashboardCuidador()),
                    );
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'LEMBRETES',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  FloatingActionButton(
                      child: Icon(Icons.add),
                      heroTag: 'btn6',
                      backgroundColor: const Color(0xFF00261d),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => AdicionarLembrete()),
                        );
                      }),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
