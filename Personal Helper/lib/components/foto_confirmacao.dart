import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';

class FotoConfirmacao extends StatefulWidget {
  const FotoConfirmacao({Key? key}) : super(key: key);

  @override
  State<FotoConfirmacao> createState() => _FotoConfirmacaoState();
}

class _FotoConfirmacaoState extends State<FotoConfirmacao> {
  Timer? _timer;
  teste() {
    print("object");
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      print('passou');
      Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard()));
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
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Dashboard()));
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
                const Text(
                  ' FOTO ENVIADA COM SUCESSO! ',
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
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
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
