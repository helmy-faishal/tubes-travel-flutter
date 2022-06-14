import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/services/user_services.dart';

class UserProvider with ChangeNotifier{
  late UserModel _user;
  bool isLoggedIn = false;

  UserModel get user => _user;
  bool get isloggedin => isloggedin;

  set user(UserModel user) {
    _user = user;
    isLoggedIn = true;
    notifyListeners();
  }

  Future<bool> register(
    String username,
    String email,
    String password
  ) async {
    try {
      UserModel user = await UserService().register(username, email, password);

      _user = user;
      isLoggedIn = true;
      notifyListeners();

      return true;

    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login(
    String email,
    String password
  ) async {
    try {
      UserModel user = await UserService().login(email, password);

      _user = user;
      isLoggedIn = true;
      notifyListeners();

      return true;

    } catch (e) {
      print(e);
      return false;
    }
  }

}