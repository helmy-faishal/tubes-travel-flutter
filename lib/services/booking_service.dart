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
      throw Exception("Gagal mengambil data");
    }
  }

  Future<bool> booking(
    String token,
    String nama,
    String paket_wisata,
    DateTime tgl_perjalanan,
    String metode_pembayaran,
    int harga,
  ) async{
    var bookingUrl = baseApiUrl+'booking/store';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    var invoice = generateInvoice();

    BookingModel booking =  BookingModel(
      nama: nama,
      paket_wisata: paket_wisata,
      tgl_perjalanan: tgl_perjalanan,
      metode_pembayaran: metode_pembayaran,
      invoice: invoice,
      harga: harga
    );
    var body = jsonEncode(booking.toJson());

    var response = await http.post(Uri.parse(bookingUrl),headers: headers, body: body);
    if (response.statusCode != 201) {
      return true;
    } else {
      throw Exception('Gagal melakukan booking');
    }
  }

  String generateInvoice() {
    var generator = RandomStringGenerator(
      minLength: 32,
      maxLength: 32,
    );
    return generator.generate();
  }
}