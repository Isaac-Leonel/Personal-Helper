import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackIdoso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: const Color(0xFF00261D),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/img/clockicon.png',
                  ),
                ),
                Text(
                  'Horarios',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Center(
              child: FloatingActionButton(
                  child: Icon(Icons.task_alt),
                  backgroundColor: const Color(0xFF32A18A),
                  onPressed: () {}),
            ),
            Column(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/img/clockicon.png',
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
