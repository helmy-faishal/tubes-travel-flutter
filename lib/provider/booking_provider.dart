// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/models/booking_model.dart';
import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/services/booking_service.dart';
import 'package:tubes_travel_flutter/services/user_services.dart';

class BookingProvider with ChangeNotifier{

  late BookingModel _booking;

  BookingModel get booking => _booking;

  set booking(BookingModel booking) {
    _booking = booking;
    notifyListeners();
  }

  Future<void> getBooking(
    String nama,
    String paket_wisata,
    String tgl_perjalanan,
    String metode_pembayaran,
    int harga,
  ) async {

    if (harga == -1){
      throw Exception('Ada Error');
    }

    BookingModel booking = BookingService().getBookingModel(
      nama,
      paket_wisata,
      tgl_perjalanan,
      metode_pembayaran,
      harga
    );

    _booking = booking;
    notifyListeners();
  }

  Future<bool> processBooking(
    String token,
    BookingModel booking,
  ) async {
    try {
      if(await BookingService().booking( token, booking, )){
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