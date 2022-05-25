import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserType extends StatelessWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF00261d),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/img/logomini.png',
                        fit: BoxFit.fitWidth,
                      )),
                  // ignore: prefer_const_constructors
                  Text(
                    'CADASTRO',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    'Escolha o tipo de conta que deseja criar',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00261d),
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Edita');
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          child: Image.asset(
                        'assets/img/idosocad.png',
                        fit: BoxFit.fitWidth,
                      )),
                      // ignore: prefer_const_constructors
                      Text(
                        'IDOSO',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF00261d),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                onPressed: () {},
                child: Column(
                  children: [
                    SizedBox(
                        child: Image.asset(
                      'assets/img/cuidadorcad.png',
                      fit: BoxFit.fitWidth,
                    )),
                    // ignore: prefer_const_constructors
                    Text(
                      'CUIDADOR',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
