import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/components/foto_confirmacao.dart';
import 'package:personal_helper/pages/dashboard/dados_medicos.dart';

class FinalFoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "btn7",
            child: Icon(Icons.check),
            backgroundColor: const Color(0xFF00261D),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => FotoConfirmacao()));
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => dados()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF00261D),
                ),
                // ignore: prefer_const_constructors
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Tentar Novamente",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
