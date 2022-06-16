import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/DashboardCuida.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdosoModulo extends StatelessWidget {
  const IdosoModulo({Key? key, required this.nome, required this.cpf})
      : super(key: key);

  final String nome;
  final String cpf;

  saveStringValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("cpf", cpf);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                saveStringValue();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DashboardCuidador()));
              },
              child: SizedBox(
                  child: Image.asset(
                'assets/img/idosocad.png',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              )),
            ),
            Text(nome,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18))
          ],
        ),
      ),
    );
  }
}
