import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/components/horarioalerta.dart';
import 'package:personal_helper/components/modulecard.dart';
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/snackbar.dart';

String getDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('HH:mm').format(now);

  return formattedDate;
}

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: const Color(0xFF00261d),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: const ProfileBar(
                    exibirSaud: true,
                    exibirBack: false,
                  ),
                ),
                Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        horarioS,
                        style: TextStyle(color: Colors.white),
                      ),
                      // ignore: prefer_const_constructors
                      HorarioAlerta(
                          alertName: 'Remedio Nutricional',
                          levelWarning: 3,
                          alertIcon: 'assets/img/remedio1.png',
                          alertTime: '17:00'),
                      HorarioAlerta(
                          alertName: 'Remedio ',
                          levelWarning: 3,
                          alertIcon: 'assets/img/remedio1.png',
                          alertTime: '17:00'),
                      HorarioAlerta(
                          alertName: 'Remedio Nutricional',
                          levelWarning: 3,
                          alertIcon: 'assets/img/remedio1.png',
                          alertTime: '17:00'),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 390,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/backgrounddash.png"),
                  fit: BoxFit.cover),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(30),

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ModuleCard(
                        iconModule: 'assets/img/caixaderemedio.png',
                        textModule: 'Caixa de Remedio'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ModuleCard(
                        iconModule: 'assets/img/caixaderemedio.png',
                        textModule: 'Caixa de Remedio'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ModuleCard(
                        iconModule: 'assets/img/caixaderemedio.png',
                        textModule: 'Caixa de Remedio'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ModuleCard(
                        iconModule: 'assets/img/caixaderemedio.png',
                        textModule: 'Caixa de Remedio'),
                  ),
                ]),
          ),
          SnackIdoso(),
        ],
      ),
    );
  }
}
