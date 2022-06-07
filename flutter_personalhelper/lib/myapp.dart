import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/components/cartao_saude.dart';
import 'package:personal_helper/pages/dashboard/alertas.dart';
import 'package:personal_helper/pages/dashboard/caixaRemedio.dart';
import 'package:personal_helper/pages/dashboard/calendario.dart';
import 'package:personal_helper/pages/dashboard/dados_medicos.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:personal_helper/pages/dashboard/instrucoesdadosPressao.dart';
import 'package:personal_helper/pages/dashboard/intrucoesdadosGlicose.dart';
import 'package:personal_helper/pages/dashboard/FotoPressao.dart';
import 'package:personal_helper/pages/dashboard/FotoGlicose.dart';
import 'package:personal_helper/pages/dashboard/FotoTemperatura.dart';
import 'package:personal_helper/pages/dashboard/instrucoesdadosTermometro.dart';
import 'package:personal_helper/pages/dashboard/edita_remedio.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';
import 'package:personal_helper/pages/singup_page/UserType.dart';
import 'package:personal_helper/pages/singup_page/singup.dart';
import 'components/tela_confirmação.dart';
import 'components/foto_confirmacao.dart';
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
<<<<<<< HEAD
        '/calendario': ((context) => const Calendario()),
=======
        /*  '/calendario': ((context) => const Calendario()), */
>>>>>>> 3fb7874d38b3c7e70c062ca8641deb6c9acd8474
        '/FotoPressao': ((context) => const FotoPressao()),
        '/FotoGlicose': ((context) => const FotoGlicose()),
        '/FotoTemperatura': ((context) => const FotoTemperatura()),
        '/foto_confirmacao': ((context) => const FotoConfirmacao()),
<<<<<<< HEAD
        '/cartaoSaude': ((context) => const CartaoSaude()),
=======
>>>>>>> 3fb7874d38b3c7e70c062ca8641deb6c9acd8474
      },
    );
  }
}
