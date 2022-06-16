// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/cuidador/components/profilebarCuida.dart';

class RelatorioPressao extends StatelessWidget {
  const RelatorioPressao({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32A18A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: const Color(0xFF00261d),
                height: 169,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const ProfileBarCuida(
                        exibirSaud: true,
                        exibirBack: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FloatingActionButton(
                    heroTag: "btn1",
                    child: const Icon(Icons.arrow_downward),
                    backgroundColor: const Color(0xFF32A18A),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/DashboardCuida');
                    }),

                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'HISTÓRICO DE PRESSÃO ARTERIAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors

                // ignore: prefer_const_constructors
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        'Data de início',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 280,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        'Data Final',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: 280,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/RelatorioPressao');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 10, top: 30),
                    child: Container(
                      height: 65,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF32A18A), spreadRadius: 3),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'PDF',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
