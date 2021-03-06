// ignore_for_file: non_constant_identifier_names, avoid_print, recursive_getters

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

  Future<bool> update(
    String username,
    String password_lama,
    String password_baru,
  ) async {
    try {
      UserModel updatedUser = await UserService().update(
        _user,username: username,
        password_lama: password_lama,
        password_baru: password_baru
      );

      _user = updatedUser;
      return true;

    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async {
    if (await UserService().logout(_user.token.toString())) {
      isLoggedIn = false;
      notifyListeners();
    } else {
      throw Exception('Gagal Logout');
    }
  }

}