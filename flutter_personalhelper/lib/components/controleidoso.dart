import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Controle extends StatelessWidget {
  const Controle({
    Key? key,
    required this.alertIcon,
    required this.alertName,
  }) : super(key: key);

  final String alertName;
  final String alertIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15, bottom: 10, top: 30),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xFF00261D),
          boxShadow: [
            BoxShadow(color: const Color(0xFF32A18A), spreadRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        alertName,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
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
