import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/models/booking_model.dart';
import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/provider/booking_provider.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

Color btnColor = const Color(0xffEAB500);
Color textLinkColor = const Color(0xff1F35F9);
Color bgHeaderColor = const Color(0xff393D40);

class BookingConfirmation extends StatelessWidget {
  const BookingConfirmation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);
    BookingModel booking = bookingProvider.booking;
    UserProvider userProvider = Provider.of<UserProvider>(context);
    UserModel user = userProvider.user;

    handleProcessBooking() async {
      if (await bookingProvider.processBooking( user.token.toString(), booking,)){
        Navigator.pushReplacementNamed(context, '/paket');
      }
    }

    Widget bookingButton() {
      return Container(
        height: 45,
        width: 150,
        margin: const EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: (){
            handleProcessBooking();
          },
          style: TextButton.styleFrom(
            backgroundColor: btnColor
          ),
          child: const Text(
            "Pesan Sekarang",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Konfirmasi'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Pemesan: ${booking.nama.toString()}'),
              SizedBox(height: 10,),
              Text('Paket: ${booking.paket_wisata.toString()}'),
              SizedBox(height: 10,),
              Text('Tanggal: ${booking.tgl_perjalanan.toString()}'),
              SizedBox(height: 10,),
              Text('Metode: ${booking.metode_pembayaran.toString()}'),
              SizedBox(height: 10,),
              Text('Harga: Rp${booking.harga.toString()}'),
              SizedBox(height: 10,),
              Text('Invoice: ${booking.invoice.toString()}'),
              SizedBox(height: 10,),
              bookingButton(),
              
            ],
          ),
        ),
      )
    );
  }
}