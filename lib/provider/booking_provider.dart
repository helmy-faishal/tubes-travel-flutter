// ignore_for_file: non_constant_identifier_names, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/models/booking_model.dart';
import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/services/booking_service.dart';
import 'package:tubes_travel_flutter/services/user_services.dart';

class BookingProvider with ChangeNotifier{

  late BookingModel _booking;
  List<BookingModel> _listBooking = [];

  BookingModel get booking => _booking;

  set booking(BookingModel booking) {
    _booking = booking;
    notifyListeners();
  }

  List<BookingModel> get listBooking => _listBooking;
  
  set listBooking(List<BookingModel> list){
    _listBooking = list;
    notifyListeners();
  }

  Future<void> getBookingData(String token) async{
    try {
      List<BookingModel> list = await BookingService().getBookingData(token);
      _listBooking = list;
      notifyListeners();
    } catch (e) {
      print(e);
    }

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

  Future<bool> deleteBooking(BookingModel booking, String token) async {
    if (await BookingService().delete(booking, token)) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> reschedule(BookingModel booking, String token, String tgl_perjalanan) async {
    try {
      BookingModel newBooking = await BookingService().reschedule(booking, token, tgl_perjalanan);
      _booking = newBooking;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}