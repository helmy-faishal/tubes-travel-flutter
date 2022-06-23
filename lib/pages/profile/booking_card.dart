import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/models/booking_model.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({ Key? key ,required this.data}) : super(key: key);
  
  final BookingModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        shadowColor: Colors.grey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  data.paket_wisata.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10,),
                  Text("Pemesan: "),
                  Text(
                    data.nama.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 10,),
                  Text(
                    data.tgl_perjalanan.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}