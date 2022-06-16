import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personal_helper/pages/cuidador/select_idoso.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';

class TelaConfirmacaoCuiLink extends StatelessWidget {
  const TelaConfirmacaoCuiLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SelectIdoso()));
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
                  'IDOSO ADICIONADO COM SUCESSO',
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
