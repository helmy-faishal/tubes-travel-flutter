// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/models/booking_model.dart';
import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/services/booking_service.dart';
import 'package:tubes_travel_flutter/services/user_services.dart';

class BookingProvider with ChangeNotifier{

  Future<bool> processBooking(
    String token,
    String nama,
    String paket_wisata,
    DateTime tgl_perjalanan,
    String metode_pembayaran,
    int harga,
  ) async {
    try {
      if(await BookingService().booking(
        token,
        nama,
        paket_wisata,
        tgl_perjalanan,
        metode_pembayaran,
        harga,
      )){
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

}