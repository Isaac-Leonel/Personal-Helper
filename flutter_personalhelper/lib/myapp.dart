import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/caixaRemedio.dart';
import 'package:personal_helper/pages/dashboard/dados_medicos.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:personal_helper/pages/dashboard/edita_remedio.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';
import 'package:personal_helper/pages/singup_page/UserType.dart';
import 'package:personal_helper/pages/singup_page/singup.dart';

import 'components/tela_confirmação.dart';
import 'pages/dashboard/edita_remedio.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/usertype': (context) => const UserType(),
        '/logon': (context) => const SingUp(),
        '/dashboard': ((context) => Dashboard()),
        '/caixaremedio': ((context) => const caixaRemedio()),
        '/edita_remedio': ((context) => const Edita()),
        '/dados_medicos': ((context) => const dados()),
      },
    );
  }
}
