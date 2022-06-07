import 'package:flutter/material.dart';
import 'package:personal_helper/components/form_salvarcuidador.dart';

import '../../components/form_salvaridoso.dart';

class SingUp extends StatelessWidget {
  const SingUp({Key? key, required this.type}) : super(key: key);

  final bool type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/img/logomini.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const Text(
              'CADASTRO',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            type
                ? const Text(
                    'IDOSO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  )
                : const Text(
                    'CUIDADOR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
            type ? SalvarIdosoForm() : SalvarCuidadorForm()
          ],
        ),
      ),
    );
  }
}
