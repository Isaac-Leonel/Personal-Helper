import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartaoSaude extends StatefulWidget {
  const CartaoSaude({Key? key}) : super(key: key);

  @override
  State<CartaoSaude> createState() => _CartaoSaudeState();
}

class _CartaoSaudeState extends State<CartaoSaude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        title: Text('PEDRO LUIZ ANTONIO DA GRAÇA'),
      ),
      backgroundColor: Colors.lightBlue.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  child: Image.asset('assets/img/perfil.png'),
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const Text('INFORMAÇÕES BÁSICAS'),
                const SizedBox(
                  height: 5,
                ),
                const Text('***.***.***-**'),
                const Text('CPF'),
                const SizedBox(
                  height: 5,
                ),
                const Text('MG-**.***.***'),
                const Text('RG'),
                const Text('**/**/****'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
