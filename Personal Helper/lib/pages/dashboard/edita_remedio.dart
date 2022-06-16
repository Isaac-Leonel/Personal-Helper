// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:personal_helper/components/profilebar.dart';

import '../../components/form_salvarremedio.dart';

class Edita extends StatelessWidget {
  const Edita({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF237C6A),
      body: SingleChildScrollView(
        child: Column(
          children: [SalvarRemedioForm()],
        ),
      ),
    );
  }
}
