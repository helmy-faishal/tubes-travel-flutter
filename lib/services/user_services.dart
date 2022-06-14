// ignore: file_names
import 'dart:convert';

import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/services/url_data.dart';
import 'package:http/http.dart' as http;

class UserService{
  Future<UserModel> register(String username, String email, String password) async {
    var registerUrl = baseApiUrl+'register';
    var headers = {'Content-Type':'application/json'};
    var body = jsonEncode({
      'username': username,
      'email': email,
      'password':password,
    });

    var response = await http.post(
      Uri.parse(registerUrl),
      headers: headers,
      body: body
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      print(data);
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }


  Future<UserModel> login(String email, String password) async {
    var loginUrl = baseApiUrl+'login';
    var headers = {'Content-Type':'application/json'};
    var body = jsonEncode({
      'email': email,
      'password':password,
    });

    var response = await http.post(
      Uri.parse(loginUrl),
      headers: headers,
      body: body
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print(data);
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  Future<bool> logout(String token) async {
    var logoutUrl = baseApiUrl+'logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    var response = await http.get(Uri.parse(logoutUrl),headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
}