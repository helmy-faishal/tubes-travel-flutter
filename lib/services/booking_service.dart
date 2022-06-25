// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:random_string_generator/random_string_generator.dart';
import 'package:tubes_travel_flutter/models/booking_model.dart';
import 'package:tubes_travel_flutter/services/url_data.dart';
import 'package:http/http.dart' as http;

class BookingService{
  Future<List<BookingModel>> getBookingData(String token) async {
    var bookingUrl = baseApiUrl+'booking/all';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    var response = await http.get(Uri.parse(bookingUrl),headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      List<BookingModel> destinasi = [];
      for (var item in data) {
        destinasi.add(BookingModel.fromJson(item));
      }
      return destinasi;
    } else {
      throw Exception(response.statusCode);
    }
  }

  BookingModel getBookingModel(
    String nama,
    String paket_wisata,
    String tgl_perjalanan,
    String metode_pembayaran,
    int harga,
  ){
    String invoice = generateInvoice();
    return BookingModel(
      nama: nama,
      paket_wisata: paket_wisata,
      tgl_perjalanan: tgl_perjalanan,
      metode_pembayaran: metode_pembayaran,
      invoice: invoice,
      harga: harga
    );
  }

  Future<bool> booking(
    String token,
    BookingModel booking,
  ) async{
    var bookingUrl = baseApiUrl+'booking/store';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    var body = jsonEncode(booking.toJson());

    var response = await http.post(Uri.parse(bookingUrl),headers: headers, body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Gagal melakukan booking');
    }
  }

  Future<BookingModel> reschedule(BookingModel booking, String token, String tgl_perjalanan) async {
    var rescheduleUrl = baseApiUrl+'booking/reschedule';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    var body = {
      "tgl_perjalanan" : tgl_perjalanan,
      "invoice" : booking.invoice,
    };

    var response = await http.post(Uri.parse(rescheduleUrl),headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      BookingModel new_booking = booking.updateFromJson(data);
      return new_booking;
    } else {
      throw Exception("Status Code: ${response.statusCode}");
    }
  }

  Future<bool> delete(BookingModel booking, String token) async {
    var rescheduleUrl = baseApiUrl+'booking/delete';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    var body = {
      "invoice" : booking.invoice,
    };

    var response = await http.delete(Uri.parse(rescheduleUrl),headers: headers,body: jsonEncode(body));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal membatalkan booking");
    }
  }

  String generateInvoice() {
    var generator = RandomStringGenerator(
      minLength: 16,
      maxLength: 32,
      hasSymbols: false,
    );
    return generator.generate();
  }
}