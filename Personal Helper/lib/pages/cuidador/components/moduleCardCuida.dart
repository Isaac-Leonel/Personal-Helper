import 'package:flutter/material.dart';
import 'package:personal_helper/pages/cuidador/cuidador_pages/caixaRemedio.dart';

class ModuleCardCuida extends StatelessWidget {
  const ModuleCardCuida(
      {Key? key, required this.iconModule, required this.textModule})
      : super(key: key);

  final String iconModule;
  final String textModule;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => caixaRemedioCui()));
      },
      child: Container(
        width: 300,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF32A18A),
          boxShadow: [
            BoxShadow(color: const Color(0xFF32A18A), spreadRadius: 3),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SizedBox(
                      child: Image.asset(
                    iconModule,
                    fit: BoxFit.fitWidth,
                    width: 40,
                    height: 40,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      textModule,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
