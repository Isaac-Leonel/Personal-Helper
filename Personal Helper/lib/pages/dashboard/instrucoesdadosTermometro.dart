// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/FotoTemperatura.dart';
import 'package:personal_helper/pages/dashboard/dados_medicos.dart';

class Temperatura extends StatelessWidget {
  const Temperatura({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32A18A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: const Color(0xFF32A18A),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'TIPO ESCOLHIDO',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                    ),
                    const Text(
                      'MEDIÇÃO DE TEMPERATURA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      '_____________________________________________',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 2),
                      child: Text(
                        'INSTRUÇÕES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: const Text(
                          '1 - Como na imagem abaixo garanta a visualização completa do aparelho;',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: const Text(
                          '2 - Recomendamos que esteja em um local iluminado para evitar a necessidade utilizar o flash da câmera;',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: const Text(
                          '3 - Após realizar a captura verifique a imagem se os números estão legíveis, caso não descarte a imagem e capture novamente;',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/temperatura.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: FloatingActionButton(
                            child: Icon(Icons.add_home_outlined),
                            backgroundColor: const Color(0xFF00261D),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => dados()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(50),
                          child: FloatingActionButton(
                            child: const Icon(Icons.add_a_photo),
                            backgroundColor: const Color(0xFF00261D),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => FotoTemperatura()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
