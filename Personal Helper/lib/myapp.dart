import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/components/cartao_saude.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/DashboardCuida.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/Relatorio.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/RelatorioGlicemia.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/RelatorioPressao.dart';
import 'package:personal_helper/pages/cuidador/Dashboardcuidador/RelatorioTemperatura.dart';
import 'package:personal_helper/pages/cuidador/components/form_salvarremedio.dart';
import 'package:personal_helper/pages/cuidador/cuidador_pages/caixaRemedio.dart';
import 'package:personal_helper/pages/cuidador/cuidador_pages/calendario.dart';
import 'package:personal_helper/pages/cuidador/linkaridoso.dart';
import 'package:personal_helper/pages/cuidador/select_idoso.dart';
import 'package:personal_helper/pages/dashboard/FotoGlicose.dart';
import 'package:personal_helper/pages/dashboard/FotoPressao.dart';
import 'package:personal_helper/pages/dashboard/FotoTemperatura.dart';
import 'package:personal_helper/pages/dashboard/Perfil.dart';
import 'package:personal_helper/pages/dashboard/adicionarLembrete.dart';
import 'package:personal_helper/pages/dashboard/alertas.dart';
import 'package:personal_helper/pages/dashboard/caixaRemedio.dart';
import 'package:personal_helper/pages/dashboard/calendario.dart';
import 'package:personal_helper/pages/dashboard/cuidadoresLinkados.dart';
import 'package:personal_helper/pages/dashboard/dados_medicos.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';
import 'package:personal_helper/pages/dashboard/edita_remedio.dart';
import 'package:personal_helper/pages/dashboard/instrucoesdadosPressao.dart';
import 'package:personal_helper/pages/dashboard/instrucoesdadosTermometro.dart';
import 'package:personal_helper/pages/dashboard/intrucoesdadosGlicose.dart';
import 'package:personal_helper/pages/dashboard/link_cuidador.dart';
import 'package:personal_helper/pages/login_page/home_page.dart';
import 'package:personal_helper/pages/singup_page/UserType.dart';
import 'package:personal_helper/pages/singup_page/singup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '_onboardingScreen.dart';
import 'components/foto_confirmacao.dart';
import 'pages/cuidador/components/tela_confirmaçãolink.dart';
import 'pages/cuidador/cuidador_pages/Perfil.dart';
import 'pages/dashboard/edita_remedio.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.getLoged}) : super(key: key);
  final bool getLoged;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: getLoged ? '/dashboard' : '/Onboarding',
      routes: {
        '/': (context) => Login(),
        '/Onboarding': (context) => OnboardingScreen(),
        '/usertype': (context) => const UserType(),
        '/logon': (context) => const SingUp(
              type: true,
            ),
        '/dashboard': ((context) => Dashboard()),
        '/DashboardCuida': ((context) => DashboardCuidador()),
        '/caixaremedio': ((context) => const caixaRemedio()),
        '/edita_remedio': ((context) => const Edita()),
        '/dados_medicos': ((context) => const dados()),
        '/instrucoesdadosPressao': ((context) => const Pressao()),
        '/intrucoesdadosGlicose': ((context) => const Glicose()),
        '/instrucoesdadosTermometro': ((context) => const Temperatura()),
        '/alertas': ((context) => const Alertas()),
        '/FotoPressao': ((context) => const FotoPressao()),
        '/FotoGlicose': ((context) => const FotoGlicose()),
        '/FotoTemperatura': ((context) => const FotoTemperatura()),
        '/foto_confirmacao': ((context) => const FotoConfirmacao()),
        '/Perfil': ((context) => const Perfil()),
        '/cartaoSaude': ((context) => const CartaoSaude()),
        '/selecionarIdoso': ((context) => SelectIdoso()),
        '/linkar_idoso': ((context) => LinkarIdoso()),
        '/cuidadoresLinkados': ((context) => CuidadoresLinkados()),
        '/linkarCuidador': ((context) => LinkCuidador()),
        '/caixaRemedio_cui': ((context) => caixaRemedioCui()),
        '/criarRemedioCui': ((context) => SalvarRemedioFormCui()),
        '/confirmaLink': ((context) => TelaConfirmacaoCuiLink()),
        '/perfilCuidador': ((context) => PerfilCui()),
        '/Relatorio': ((context) => Relatorio()),
        '/RelatorioPressao': ((context) => RelatorioPressao()),
        '/RelatorioGlicemia': ((context) => RelatorioGlicemia()),
        '/RelatorioTemperatura': ((context) => RelatorioTemperatura()),
        '/adicionar_lembrete': ((context) => AdicionarLembrete())
      },
    );
  }
}
