import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/alertas.dart';
import 'package:personal_helper/pages/dashboard/cuidadoresLinkados.dart';
import 'package:personal_helper/pages/dashboard/dados_medicos.dart';

class SnackIdoso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF00261D),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/img/clockicon.png',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Alertas()),
                    );
                  },
                ),
                Text(
                  'Lembretes',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: FloatingActionButton(
                    child: Icon(Icons.monitor_heart_outlined),
                    backgroundColor: const Color(0xFF32A18A),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => dados()),
                      );
                    }),
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/img/vector.png',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CuidadoresLinkados()),
                    );
                  },
                ),
                Text(
                  'Cuidadores',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
