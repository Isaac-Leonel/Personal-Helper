import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Controle3 extends StatelessWidget {
  const Controle3({
    Key? key,
    required this.alertName3,
  }) : super(key: key);

  final String alertName3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15, bottom: 10, top: 30),
      child: Container(
        height: 65,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xFF00261D),
          boxShadow: [
            BoxShadow(color: const Color(0xFF32A18A), spreadRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        alertName3,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 117),
                      child: FloatingActionButton(
                          child: Icon(Icons.add_a_photo),
                          backgroundColor: const Color(0xFF32A18A),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/dados_medicos');
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
