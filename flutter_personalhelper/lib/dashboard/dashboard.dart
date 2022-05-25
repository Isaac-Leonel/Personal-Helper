import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_helper/components/horarioalerta.dart';
import 'package:personal_helper/components/profilebar.dart';

class Dashboard extends StatelessWidget {
  // Get the time
  // final DateTime now = DateTime.now();
  // final String formattedDate = get DateFormat('kk:mm:ss \n EEE d MMM').format(now)

  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
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
                      alertName: 'Agua',
                      levelWarning: 3,
                      alertIcon: 'water drop',
                      alertTime: '13:00'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
