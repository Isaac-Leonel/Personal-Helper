import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'myapp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF00261d),
  ));
  runApp(const MyApp());
}
