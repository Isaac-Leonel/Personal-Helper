import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/edita_remedio.dart';

class ModuleCardRemedio extends StatelessWidget {
  const ModuleCardRemedio({
    Key? key,
    required this.iconModule,
    required this.textModule,
    required this.qtAtual,
    required this.qtTotal,
  }) : super(key: key);

  final String iconModule;
  final String textModule;
  final int qtAtual;
  final int qtTotal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 130,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF32A18A),
          image: const DecorationImage(
              image: AssetImage("assets/img/onda.png"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  textModule,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(iconModule),
                ),
                const Text(
                  "Comprimidos",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  qtAtual.toString() + " | " + qtTotal.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
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
