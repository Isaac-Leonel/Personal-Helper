//import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar(
      {Key? key, required this.exibirSaud, required this.exibirBack})
      : super(key: key);

  final bool exibirSaud;
  final bool exibirBack;

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
              exibirSaud
                  ? Text(
                      'Olá! Pedro',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(''),
            ],
          ),
          exibirBack
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
