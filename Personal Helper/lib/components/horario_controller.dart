import 'package:flutter/cupertino.dart';

class HorarioContoller extends ChangeNotifier {
  static HorarioContoller instance = HorarioContoller();

  bool isLate = false;

  changeColor() {
    isLate = !isLate;
    notifyListeners();
  }
}
