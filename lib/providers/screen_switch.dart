import 'package:flutter/material.dart';
import 'package:practice_isar/pages/home_page.dart';
import 'package:practice_isar/pages/welcome.dart';

class ScreenSwitch extends ChangeNotifier {
  ScreenSwitch({this.screen = const Welcome()});
  Widget screen;
  void homepage() {
    screen = const Homepage();
    notifyListeners();
  }
}
