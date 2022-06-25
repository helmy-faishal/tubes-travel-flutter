// ignore_for_file: avoid_print, unnecessary_getters_setters

import 'package:flutter/cupertino.dart';
import 'package:tubes_travel_flutter/models/destination_model.dart';
import 'package:tubes_travel_flutter/services/blog_services.dart';

class BlogProvider with ChangeNotifier{
  List<DestinationModel> _destinasi = [];
  String _kategori = 'alam';

  List<DestinationModel> get destination => _destinasi;
  
  set destination(List<DestinationModel> destinasi){
    _destinasi = destinasi;
  }

  set kategori(String kategori){
    _kategori = kategori;
  }

  Future<void> getDestination() async {
    try {
      List<DestinationModel> destinasi = await BlogServices().getBlog(_kategori);
      _destinasi = destinasi;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  
}