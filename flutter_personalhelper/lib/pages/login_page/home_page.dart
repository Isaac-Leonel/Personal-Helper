import 'package:flutter/material.dart';
import 'package:personal_helper/models/idoso.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Future<Idoso> futureIdoso;

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final senhaController = TextEditingController();

    @override
    void dispose() {
      // limpa o controller quando for liberado
      loginController.dispose();
      super.dispose();
    }

    Future<String> fetchAlbum(String Login, String Senha) async {
      print(Login + Senha);
      final response = await http.get(Uri.parse(
          'https://b542-2804-7f2-2789-3253-916e-5758-e59c-9e71.sa.ngrok.io/api/ph/elderly/validate_login/${Login}/${Senha}'));
      var body = response.body;
      print(body);
      if (body != "falhou" || response.statusCode != 404) {
        print(body);
        Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard()));
        return body;
      } else {
        final teste = await http.get(Uri.parse(
            'https://77b1-2804-7f2-2789-3253-916e-5758-e59c-9e71.sa.ngrok.io/api/ph/caregiver/validate_login/${Login}/${Senha}'));
        var cuidador = teste.body;
        if (cuidador != "falhou" || response.statusCode != 404) {
          print(cuidador);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Dashboard()));
          return cuidador;
        } else {
          print('Login Incorreto');
        }
      }
      return "deu errado";
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: loginController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: senhaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonTheme(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => {
                    fetchAlbum(loginController.text, senhaController.text)
                    // Navigator.of(context).pushNamed('/dashboard')
                  },
                  //fetchAlbum(loginController.text, senhaController.text)
                  //Navigator.of(context).pushNamed('/usertype')
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
    );
  }
}
