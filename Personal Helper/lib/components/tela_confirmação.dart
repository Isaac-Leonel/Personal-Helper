import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';

class TelaConfirmacao extends StatelessWidget {
  const TelaConfirmacao({Key? key, required this.mensagem, required this.rota})
      : super(key: key);

  final String mensagem;
  final bool rota;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            rota
                ? Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Dashboard()))
                : Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Login()));
          },
          child: Container(
            color: const Color(0xFF32A18A),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  mensagem + ' CRIADO COM SUCESSO! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 125,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: const Text(
                    'PRESSIONE A TELA PARA PROSSEGUIR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
