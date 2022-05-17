import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../components/inputcad.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00261d),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/logoimg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              const Text(
                'Digite seus dados para entrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const InputCad(
                  inputname: 'CPF',
                ),
              ),
              const InputCad(inputname: 'Senha'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonTheme(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => {
                      print("pressionei o botão"),
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF32A18A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ), //RaisedButtons
                ),
              ),
              TextButton(
                onPressed: () {
                  print('funciona');
                  Navigator.of(context).pushNamed('/usertype');
                },
                child: const Text(
                  'Ainda não possui uma conta? Cadastre-se',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
