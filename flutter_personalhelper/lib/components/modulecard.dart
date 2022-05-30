import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard(
      {Key? key, required this.iconModule, required this.textModule})
      : super(key: key);

  final String iconModule;
  final String textModule;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/caixaremedio');
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF32A18A),
          boxShadow: [
            BoxShadow(color: const Color(0xFF32A18A), spreadRadius: 3),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    width: 100, height: 100, child: Image.asset(iconModule)),
                Text(
                  textModule,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
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
