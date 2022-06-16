import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:personal_helper/pages/dashboard/link_cuidador.dart';

import '../../components/horarioalerta.dart';
import '../../components/profilebar.dart';

class CuidadoresLinkados extends StatefulWidget {
  @override
  State<CuidadoresLinkados> createState() => _CuidadoresLinkadosState();
}

class _CuidadoresLinkadosState extends State<CuidadoresLinkados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 161, 138, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              color: const Color(0xFF00261d),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child:
                        const ProfileBar(exibirSaud: true, exibirBack: false),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              FloatingActionButton(
                  child: const Icon(Icons.arrow_downward),
                  backgroundColor: const Color(0xFF32A18A),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Dashboard()));
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'CUIDADOR',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  FloatingActionButton(
                      child: Icon(Icons.add),
                      heroTag: 'btn6',
                      backgroundColor: const Color(0xFF00261d),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LinkCuidador()));
                      }),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
