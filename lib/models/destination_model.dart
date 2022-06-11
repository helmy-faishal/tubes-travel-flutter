// ignore_for_file: non_constant_identifier_names

class DestinationModel{
  String? nama;
  String? deskripsi;
  String? gambar;
  String? kategori;
  String? lokasi;
  String? harga;
  String? link_resmi;

  DestinationModel({
    this.nama,
    this.deskripsi,
    this.gambar,
    this.kategori,
    this.lokasi,
    this.harga,
    this.link_resmi,
  });

  DestinationModel.fromJson(Map<String, dynamic> json){
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    gambar = json['gambar'];
    kategori = json['kategori'];
    lokasi = json['lokasi'];
    harga = json['harga'];
    link_resmi = json['link_resmi'];
  }

  Map<String, dynamic> toJson(){
    return {
      'nama' : nama,
      'deskripsi' : deskripsi,
      'gambar' : gambar,
      'kategori' : kategori,
      'lokasi' : lokasi,
      'harga' : harga,
      'link_resmi' : link_resmi
    };
  }
}