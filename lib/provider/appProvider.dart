import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String appName = "Providers";
  bool loginStep;

  // void increment() {
  //    _incValue = _incValue + 1;
  //    notifyListeners();
  //  }

  //int loginvalue() => _incValue;

  Future<void> appInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginStep = prefs.getBool('loginStatus') ?? false;
  }
}
