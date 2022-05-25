import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/dashboard/dashboard.dart';

import 'login_page/home_page.dart';
import 'singup_page/UserType.dart';
import 'singup_page/singup.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/usertype': (context) => const UserType(),
        '/logon': (context) => const SingUp(),
        '/dashboard': ((context) => Dashboard())
      },
    );
  }
}
