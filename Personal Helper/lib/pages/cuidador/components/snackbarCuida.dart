import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/Relatorio.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';

class SnackIdosoCuida extends StatelessWidget {
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
                    'assets/img/leftArrow.png',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Login()));
                  },
                ),
                Text(
                  'SAIR',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Center(
                    child: FloatingActionButton(
                        child: Icon(Icons.request_page_sharp),
                        backgroundColor: const Color(0xFF32A18A),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Relatorio()));
                        }),
                  ),
                ],
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
                  'Pessoas',
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
