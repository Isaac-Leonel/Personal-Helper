//import 'dart:ffi';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:personal_helper/models/idoso.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late Future<Idoso> futureIdoso;
  var idosoAPI = ngrok.idoso;
  var cuidadorAPI = ngrok.cuidador;

  Future<Idoso> fetchGetUserByCpf() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http
        .get(Uri.parse('${idosoAPI}/api/ph/elderly/look_for/${value}'));
    if (response.statusCode == 200) {
      return Idoso.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Idoso');
    }
  }

  @override
  void initState() {
    futureIdoso = fetchGetUserByCpf();
    super.initState();
  }

  pegarImagemGaleria() async {
    final PickedFile? imagemTemporaria =
        // ignore: deprecated_member_use
        await imagePicker.getImage(source: ImageSource.gallery);
    if (imagemTemporaria != null) {
      setState(() {
        imagemSelecionada = File(imagemTemporaria.path);
      });
      return imagemSelecionada;
    }
  }

  @override
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;
  Widget build(BuildContext context) {
    idosologout() async {
      final prefs = await SharedPreferences.getInstance();
      final success = await prefs.remove('cpf');
      print(success);
      if (success == true) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
      } else {
        print("impossivel Sair");
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Dashboard()));
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Personal Helper',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00261d),
                          elevation: 0,
                          // ignore: unnecessary_new
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {
                        pegarImagemGaleria();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              child: Image.asset(
                            'assets/img/idosoperfil.png',
                            fit: BoxFit.fitWidth,
                          )),
                          // ignore: prefer_const_constructors
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder<Idoso>(
                      future: futureIdoso,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.name,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Text('');
                      }), // ignore: prefer_const_constructors

                  // ignore: prefer_const_constructors

                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: const Text(
                      '___________________________',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors

                  const Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Data de Nascimento',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  FutureBuilder<Idoso>(
                      future: futureIdoso,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.birthday,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Text('');
                      }),
                  const Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  FutureBuilder<Idoso>(
                      future: futureIdoso,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.email,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Text('');
                      }),
                  const Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'CPF',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  FutureBuilder<Idoso>(
                      future: futureIdoso,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.cpf,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Text('');
                      }),

                  const Text(
                    '___________________________',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ButtonTheme(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () => {idosologout()},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFCB6464),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "SAIR DA CONTA",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ), //RaisedButtons
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
