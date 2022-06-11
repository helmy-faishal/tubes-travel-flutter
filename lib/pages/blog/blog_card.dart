import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/models/destination_model.dart';
import 'package:tubes_travel_flutter/services/url_data.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({ Key? key, required this.data}) : super(key: key);
  
  final DestinationModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffEED991),
        borderRadius: BorderRadius.circular(10),
        border: Border.all()
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(data.nama.toString())),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Container(
              width: 183,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Image.network(
                baseUrl+data.gambar.toString(),
                width: 183,
                height: 110,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            data.deskripsi.toString(),
            overflow: TextOverflow.clip,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text("Lokasi: "+data.lokasi.toString()),
          ),
          const SizedBox(height: 30,),
          Text( data.harga != null ? 'Info Harga/Tiket: ${data.harga.toString()}':''),
          const SizedBox(height: 10,),
          Text( data.link_resmi != null ? 'Link Resmi: ${data.link_resmi.toString()}':''),
          
        ],
      ),
    );
  }
}