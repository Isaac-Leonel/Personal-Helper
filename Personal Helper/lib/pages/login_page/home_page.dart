import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/models/idoso.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:personal_helper/pages/singup_page/UserType.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cuidador/select_idoso.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Future<Idoso> futureIdoso;

   static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        print("No user found on that email");
      }
    }
    return user;
  }


  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final senhaController = TextEditingController();

    var idosoAPI = ngrok.idoso;
    var cuidadorAPI = ngrok.cuidador;

    printErro() {
      return showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Falha ao entrar!'),
                content: const Text('Usuario e/ou senha incorretos'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }

    saveStringValue(String cpf) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("cpf", cpf);
    }

    saveStringValueCuidador(String cpf) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("cuidador", cpf);
    }

    Future<String> fetchAlbum(String Login, String Senha) async {
      print(Login + Senha);

      final response = await http.get(Uri.parse(
          '${idosoAPI}/api/ph/elderly/validate_login/${Login}/${Senha}'));
      var body = response.body;
      print("BODY: " + body);
      if (body == "falhou" || response.statusCode != 200) {
        final teste = await http.get(Uri.parse(
            '${cuidadorAPI}/api/ph/caregiver/validate_login/${Login}/${Senha}'));
        var cuidador = teste.body;
        if (cuidador == "falhou" || teste.statusCode != 200) {
          printErro();
        } else {
          print(cuidador);
          saveStringValueCuidador(cuidador);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SelectIdoso()));
          return cuidador;
        }
      } else {
        print(body);
        saveStringValue(body);
        Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard()));
        return body;
      }
      return body;
    }

    return Scaffold(
      backgroundColor: Color(0xFF00261d),
      body: SingleChildScrollView(
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
            Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!)!.save();
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: loginController,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? value) {},
                      validator: (value) {
                        if (value == null || !value.contains("@")) {
                          return "Gentileza informar um e-mail valido!";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Digite seu login',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: senhaController,
                      decoration: InputDecoration(
                        hintText: 'Digite sua senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonTheme(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard())),
                  /*
                      {fetchAlbum(loginController.text, senhaController.text)},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF32A18A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),roffodff
                  ),*/
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
              onPressed: () async {
                print('funciona');
                User? user =  await loginUsingEmailPassword(email: loginController.text, password: senhaController.text, context: context);
                if(user != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:((context) => Dashboard())));
                } 
              },
              child: const Text(
                'Ainda não possui uma conta? Cadastre-se',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
