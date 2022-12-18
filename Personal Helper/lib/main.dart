import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myapp.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF00261d),
  ));

  runApp(DefineUsuarioType());
}

class DefineUsuarioType extends StatefulWidget {
  @override
  State<DefineUsuarioType> createState() => _DefineUsuarioTypeState();
}

Future<FirebaseApp> _initializaFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

class _DefineUsuarioTypeState extends State<DefineUsuarioType> {
  late Timer _timer;
  int _start = 2;

  getUserType() async {
    print('entrou');
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("cpf");
    print(value);
    if (value != null) {
      runApp(const MyApp(getLoged: true));
    } else {
      runApp(const MyApp(getLoged: false));
    }
  }

  temporizador() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            print('acabou');
            getUserType();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    temporizador();
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xFF00261d),
            body: FutureBuilder(builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white,
                  size: 100,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
