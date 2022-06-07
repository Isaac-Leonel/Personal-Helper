//import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:personal_helper/models/idoso.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileBar extends StatefulWidget implements Login {
  const ProfileBar(
      {Key? key, required this.exibirSaud, required this.exibirBack})
      : super(key: key);

  final bool exibirSaud;
  final bool exibirBack;

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(05.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/img/idosocad.png',
                fit: BoxFit.fitWidth,
                width: 30,
                height: 30,
              )),
              widget.exibirSaud
                  ? FutureBuilder<Idoso>(
                      future: futureIdoso,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            'Ola! ' + snapshot.data!.name,
                            style: TextStyle(color: Colors.white),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Text('');
                      })
                  : Text(''),
            ],
          ),
          widget.exibirBack
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/dashboard');
                  },
                )
              : Icon(null),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).pushNamed('/Perfil');
            },
          )
        ],
      ),
    );
  }
}
