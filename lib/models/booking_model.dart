// ignore_for_file: non_constant_identifier_names

import 'package:random_string_generator/random_string_generator.dart';

class BookingModel{
  int? id;
  String? nama;
  String? paket_wisata;
  DateTime? tgl_perjalanan;
  String? metode_pembayaran;
  String? invoice;
  int? harga;

  BookingModel({
    this.id,
    this.nama,
    this.paket_wisata,
    this.tgl_perjalanan,
    this.metode_pembayaran,
    this.invoice,
    this.harga,
  });

  BookingModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nama = json['nama'];
    paket_wisata = json['paket_wisata'];
    tgl_perjalanan = json['tgl_perjalanan'];
    metode_pembayaran = json['metode_pembayaran'];
    invoice = json['invoice'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson(){
    return {
      'user_id' : id,
      'nama' : nama,
      'paket_wisata' : paket_wisata,
      'tgl_perjalanan' : tgl_perjalanan,
      'metode_pembayaran' : metode_pembayaran,
      'invoice' : invoice,
      'harga' : harga,
    };
  }
}