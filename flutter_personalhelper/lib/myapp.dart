import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page/home_page.dart';
import 'singup_page/UserType.dart';
import 'singup_page/logon.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Logon(),
    );
  }
}
