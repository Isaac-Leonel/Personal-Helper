import 'package:flutter/material.dart';

class ModuleCardRemedio extends StatelessWidget {
  const ModuleCardRemedio(
      {Key? key,
      required this.iconModule,
      required this.textModule,
      required this.textModule1,
      required this.textModule2})
      : super(key: key);

  final String iconModule;
  final String textModule;
  final String textModule1;
  final String textModule2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/edita_remedio');
      },
      child: Container(
        width: 130,
        height: 180,
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
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                    width: 200, height: 100, child: Image.asset(iconModule)),
                Text(
                  textModule1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
                Text(
                  textModule2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
