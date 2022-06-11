// ignore: file_names
import 'dart:convert';

import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/services/url_data.dart';
import 'package:http/http.dart' as http;

class UserSevice{
  Future<UserModel>register(String username,String email,String password) async {
    var blogUrl = baseApiUrl+'/register';
    var headers = {'Content-Type':'application/json'};
    var body = {
      'username': username,
      'email': email,
      'password':password,
    };

    var response = await http.post(
      Uri.parse(blogUrl),
      headers: headers,
      body: body
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}