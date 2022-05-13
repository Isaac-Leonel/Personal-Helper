import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/inputcad.dart';

class Logon extends StatelessWidget {
  const Logon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00261d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/img/logomini.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const Text(
              'CADASTRO',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const Text(
              'IDOSO',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
            ),
            const InputCad(
              inputname: 'Email',
            )
          ],
        ),
      ),
    );
  }
}
