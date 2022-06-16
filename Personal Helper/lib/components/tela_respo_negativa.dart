import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';

class TelaConfirmacao extends StatefulWidget {
  const TelaConfirmacao({Key? key}) : super(key: key);

  @override
  State<TelaConfirmacao> createState() => _TelaConfirmacaoState();
}

class _TelaConfirmacaoState extends State<TelaConfirmacao> {
  Timer? _timer;
  teste() {
    print("object");
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      print('passou');
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      teste();
      super.initState();
    }

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
          },
          child: Container(
            color: const Color(0xFFCB6464),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  ' ERRO AO CRIAR USUARIO ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 125,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'GENTILEZA TENTAR NOVAMENTE',
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
