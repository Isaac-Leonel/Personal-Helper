import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/components/horarioalerta.dart';
import 'package:personal_helper/components/modulecard.dart';
import 'package:personal_helper/components/profilebar.dart';
import 'package:personal_helper/components/snackbar.dart';

class Dashboard extends StatelessWidget {
  // Get the time
  // final DateTime now = DateTime.now();
  // final String formattedDate = get DateFormat('kk:mm:ss \n EEE d MMM').format(now)

  const Dashboard({Key? key}) : super(key: key);
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
                const ProfileBar(),
                Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'O horario atual é: ',
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
          Column(
            children: [
              // SizedBox(
              //     child: Image.asset(
              //   'assets/img/backgrounddash.png',
              //   fit: BoxFit.fitWidth,
              //   width: MediaQuery.of(context).size.width,
              //   height: 400,
              // )),
              ModuleCard(
                  iconModule: 'assets/img/caixaderemedio.png',
                  textModule: 'Caixa de Remedio')
            ],
          ),
          SnackIdoso(),
        ],
      ),
    );
  }
}
