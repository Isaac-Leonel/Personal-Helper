// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:personal_helper/components/profilebar.dart';

import '../components/inputcads.dart';
import '../components/inputcadmin.dart';
import '../components/inputcadminr.dart';

class Edita extends StatelessWidget {
  const Edita({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF237C6A),
      body: Column(
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

      ),
    );
  }
}
