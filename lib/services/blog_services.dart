import 'dart:convert';

import 'package:tubes_travel_flutter/models/destination_model.dart';
import 'package:tubes_travel_flutter/services/url_data.dart';
import 'package:http/http.dart' as http;

class BlogServices{
  Future<List<DestinationModel>> getBlog(String kategori) async {
    var blogUrl = baseApiUrl+'blog/'+kategori;
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(blogUrl),headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      List<DestinationModel> destinasi = [];
      for (var item in data) {
        destinasi.add(DestinationModel.fromJson(item));
      }
      return destinasi;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}