import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../components/FinalControle.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
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
        child: Column(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'Pedro Augusto',
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'Biografia',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  const Text(
                    'Enfermeira especializada em cuidado do idoso',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 19,
                    ),
                  ),
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
        ),
      ),
    );
  }
}
