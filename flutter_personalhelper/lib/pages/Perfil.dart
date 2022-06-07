import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../models/idoso.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late Future<Idoso> futureIdoso;

  Future<Idoso> fetchGetUserByCpf() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    final response = await http.get(Uri.parse(
        'https://c3c4-2804-7f2-2789-3253-7007-7b01-7d45-1af0.sa.ngrok.io/api/ph/elderly/look_for/${value}'));
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
    return Scaffold(
      backgroundColor: const Color(0xFF00261d),
      body: SingleChildScrollView(
        child: FutureBuilder<Idoso>(
            future: futureIdoso,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Center(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 50, bottom: 5),
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
                                      borderRadius:
                                          BorderRadius.circular(100))),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                snapshot.data!.name,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.create_outlined),
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () {},
                              )
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: const Text(
                              '_______________________________________________',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                'Informações Gerais',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 23,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.create_outlined),
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/Perfil');
                                },
                              )
                            ],
                          ),
                          const Text(
                            '_______________________________________________',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Text('');
            }),
      ),
    );
  }
}
