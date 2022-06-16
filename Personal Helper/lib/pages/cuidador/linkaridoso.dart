import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:personal_helper/pages/cuidador/components/profilebar_cui.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:http/http.dart' as http;
import 'package:personal_helper/pages/cuidador/components/tela_confirma%C3%A7%C3%A3olink.dart';
import 'package:personal_helper/pages/cuidador/select_idoso.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../models/idoso.dart';

class LinkarIdoso extends StatefulWidget {
  @override
  State<LinkarIdoso> createState() => _LinkarIdosoState();
}

class _LinkarIdosoState extends State<LinkarIdoso> {
  var idosoAPI = ngrok.idoso;
  var cuidadorAPI = ngrok.cuidador;
  String ticket = '';

  printErro(String erro) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Falha ao linkar'),
              content: Text('CPF e/ou Token incorretos!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cpfController = TextEditingController();
    final tokenController = TextEditingController();

    fetchLinkCuidadorIdoso() async {
      final prefs = await SharedPreferences.getInstance();
      String? value = prefs.getString("cuidador");
      print(value);
      print(cpfController.text);
      final response = await http.patch(Uri.parse(
          '${cuidadorAPI}/api/ph/caregiver/link_elderly_caregiver/${cpfController.text}/${value}/${tokenController.text}'));
      if (response.statusCode == 200) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => TelaConfirmacaoCuiLink()));
        print(response.body);
        return response.body;
      } else {
        printErro(response.body);
        print("linkou nao!");
      }
    }

    fetchLinkCuidadorIdosoQR(String qrcode) async {
      final prefs = await SharedPreferences.getInstance();
      String? value = prefs.getString("cuidador");
      print(value);
      print(cpfController.text);
      final response = await http.patch(Uri.parse(
          '${cuidadorAPI}/api/ph/caregiver/link_elderly_caregiver/${cpfController.text}/${value}/${qrcode}'));
      if (response.statusCode == 200) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => TelaConfirmacaoCuiLink()));
        print(response.body);
        return response.body;
      } else {
        printErro(response.body);
        print("linkou nao!");
      }
    }

    readQR() async {
      String code = await FlutterBarcodeScanner.scanBarcode(
          '#FFFFFF', 'Cancelar', true, ScanMode.QR);

      setState(() {
        ticket = code;
        print('ticket');
        fetchLinkCuidadorIdosoQR(ticket);
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xFF32A18A),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xFF00261d),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: const ProfileBarCuidador(
                  exibirBack: false,
                  exibirSaud: true,
                ),
              ),
              FloatingActionButton(
                  heroTag: "btn1",
                  child: const Icon(Icons.arrow_downward),
                  backgroundColor: const Color(0xFF32A18A),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => SelectIdoso()));
                  }),
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  'ADICIONAR IDOSO',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  'Solicite o idoso o token de verificação \n Como gerar Token: \n 1 - Tela Inicial > Cuidador > Novo > Gerar Token \n QR CODE \n 1- Digite o CPF DO IDOSO. \n 2- Clique no Icone para ler o QR CODE logo abaixo do campo do token.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      'CPF do idoso',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: cpfController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      'TOKEN Verificador',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: tokenController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                    child: Icon(Icons.qr_code),
                    heroTag: "btn11",
                    backgroundColor: const Color(0xFF00261d),
                    onPressed: () {
                      'teste';
                      readQR();
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                    child: Icon(Icons.check),
                    heroTag: "btn10",
                    backgroundColor: const Color(0xFF00261d),
                    onPressed: () {
                      fetchLinkCuidadorIdoso();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
