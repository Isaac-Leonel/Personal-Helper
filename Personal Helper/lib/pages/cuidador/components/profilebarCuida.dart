//import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_helper/models/idoso.dart';
import 'package:personal_helper/models/ngrok.dart' as ngrok;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBarCuida extends StatefulWidget {
  const ProfileBarCuida(
      {Key? key, required this.exibirSaud, required this.exibirBack})
      : super(key: key);

  final bool exibirSaud;
  final bool exibirBack;

  @override
  State<ProfileBarCuida> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBarCuida> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            child: Image.asset(
          'assets/img/idosocuida.png',
          fit: BoxFit.fitWidth,
        )),
        widget.exibirSaud
            ? Center(
                child: FutureBuilder<Idoso>(
                    future: futureIdoso,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Text('');
                    }),
              )
            : Text(''),
      ],
    );
  }
}
