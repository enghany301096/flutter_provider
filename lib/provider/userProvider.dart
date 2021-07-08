import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String user = 'hany';
  String password = '12';
  bool loginStatus = false;

  Future<void> login(String username, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (username == user && pass == password) {
      loginStatus = true;
      prefs.setBool('loginStatus', loginStatus);
    } else {
      loginStatus = false;
      prefs.setBool('loginStatus', loginStatus);
    }
    print("user status-->>${loginStatus}");
    notifyListeners();
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }
  Future<void> appInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginStatus = prefs.getBool('loginStatus') ?? false;
    notifyListeners();
  }
}
