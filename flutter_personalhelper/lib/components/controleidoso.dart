import 'package:flutter/material.dart';

class Controle extends StatelessWidget {
  const Controle({
    Key? key,
    required this.alertName,
    required this.rota,
    required this.hero,
  }) : super(key: key);

  final String alertName;
  final String rota;
  final String hero;

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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                alertName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FloatingActionButton(
                  heroTag: hero,
                  child: Icon(Icons.add_a_photo),
                  backgroundColor: const Color(0xFF32A18A),
                  onPressed: () {
                    Navigator.of(context).pushNamed(rota);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
