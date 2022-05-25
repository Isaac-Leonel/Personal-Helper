import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard(
      {Key? key, required this.iconModule, required this.textModule})
      : super(key: key);

  final String iconModule;
  final String textModule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 300,
        color: const Color(0xFF32A18A),
        child: Center(
          child: Column(
            children: [
              SizedBox(width: 20, height: 20, child: Image.asset(iconModule)),
              Text(
                textModule,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
