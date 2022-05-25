// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/inputcad.dart';

class Edita extends StatelessWidget {
  const Edita({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF237C6A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF00261d),
              height: 200,
            ),
            Container(
              color: Color.fromARGB(255, 88, 153, 138),
              height: 200,
            ),
            Text('Insira embaixo')
          ],
        ),
      ),
    );
  }
}
