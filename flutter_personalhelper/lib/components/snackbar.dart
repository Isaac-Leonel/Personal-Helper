import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    Navigator.of(context).pushNamed('/alertas');
                  },
                ),
                Text(
                  'Horarios',
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
                      Navigator.of(context).pushNamed('/dados_medicos');
                    }),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'assets/img/vector.png',
                  ),
                ),
                Text(
                  'Horarios',
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
