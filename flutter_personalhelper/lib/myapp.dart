import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/components/cartao_saude.dart';
import 'package:personal_helper/pages/FotoGlicose.dart';
import 'package:personal_helper/pages/FotoPressao.dart';
import 'package:personal_helper/pages/FotoTemperatura.dart';
import 'package:personal_helper/pages/Perfil.dart';
import 'package:personal_helper/pages/UserType.dart';
import 'package:personal_helper/pages/alertas.dart';
import 'package:personal_helper/pages/caixaRemedio.dart';
import 'package:personal_helper/pages/calendario.dart';
import 'package:personal_helper/pages/dados_medicos.dart';
import 'package:personal_helper/pages/dashboard.dart';
import 'package:personal_helper/pages/edita_remedio.dart';
import 'package:personal_helper/pages/home_page.dart';
import 'package:personal_helper/pages/instrucoesdadosPressao.dart';
import 'package:personal_helper/pages/instrucoesdadosTermometro.dart';
import 'package:personal_helper/pages/intrucoesdadosGlicose.dart';
import 'package:personal_helper/pages/singup.dart';

import 'components/foto_confirmacao.dart';
import 'pages/edita_remedio.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/usertype': (context) => const UserType(),
        '/logon': (context) => const SingUp(
              type: true,
            ),
        '/dashboard': ((context) => Dashboard()),
        '/caixaremedio': ((context) => const caixaRemedio()),
        '/edita_remedio': ((context) => const Edita()),
        '/dados_medicos': ((context) => const dados()),
        '/instrucoesdadosPressao': ((context) => const Pressao()),
        '/intrucoesdadosGlicose': ((context) => const Glicose()),
        '/instrucoesdadosTermometro': ((context) => const Temperatura()),
        '/alertas': ((context) => const Alertas()),
        '/calendario': ((context) => const Calendario()),
        '/FotoPressao': ((context) => const FotoPressao()),
        '/FotoGlicose': ((context) => const FotoGlicose()),
        '/FotoTemperatura': ((context) => const FotoTemperatura()),
        '/foto_confirmacao': ((context) => const FotoConfirmacao()),
        '/Perfil': ((context) => const Perfil()),
        '/cartaoSaude': ((context) => const CartaoSaude()),
      },
    );
  }
}
