// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../components/FinalControle.dart';
import 'dashboard.dart';

class FotoGlicose extends StatefulWidget {
  const FotoGlicose({Key? key}) : super(key: key);

  @override
  State<FotoGlicose> createState() => _FotoGlicoseState();
}

class _FotoGlicoseState extends State<FotoGlicose> {
  pegarImagemGaleria() async {
    final PickedFile? imagemTemporaria =
        // ignore: deprecated_member_use
        await imagePicker.getImage(source: ImageSource.camera);
    if (imagemTemporaria != null) {
      setState(() {
        imagemSelecionada = File(imagemTemporaria.path);
      });
      return imagemSelecionada;
    }
  }

  @override
  void initState() {
    pegarImagemGaleria();
    super.initState();
  }

  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32A18A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: const Color(0xFF32A18A),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'TIPO ESCOLHIDO',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                    ),
                    const Text(
                      'MEDICAO DE GLICOSE ARTERIAL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      '_____________________________________________',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 2),
                      child: Text(
                        'FOTO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    imagemSelecionada == null
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.all(80.0),
                            child: Image.file(imagemSelecionada!),
                          ),
                    FinalFoto(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
