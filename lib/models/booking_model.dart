// ignore_for_file: non_constant_identifier_names

class BookingModel{
  String? nama;
  String? paket_wisata;
  String? tgl_perjalanan;
  String? metode_pembayaran;
  String? invoice;
  int? harga;

  BookingModel({
    this.nama,
    this.paket_wisata,
    this.tgl_perjalanan,
    this.metode_pembayaran,
    this.invoice,
    this.harga,
  });

  BookingModel.fromJson(Map<String, dynamic> json){
    nama = json['nama'];
    paket_wisata = json['paket_wisata'];
    tgl_perjalanan = json['tgl_perjalanan'];
    metode_pembayaran = json['metode_pembayaran'];
    invoice = json['invoice'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson(){
    return {
      'nama' : nama,
      'paket_wisata' : paket_wisata,
      'tgl_perjalanan' : tgl_perjalanan,
      'metode_pembayaran' : metode_pembayaran,
      'invoice' : invoice,
      'harga' : harga,
    };
  }
}