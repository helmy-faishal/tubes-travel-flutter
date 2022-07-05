// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
        Alert(
          context: context,
          type: AlertType.success,
          title: "Berhasil",
          desc: "Berhasil melakukan pemesanan",
        ).show();
        Timer(const Duration(seconds: 1), (){
          Navigator.pushNamedAndRemoveUntil(context, "/paket", (route) => false);
        });
      }
    }

    Widget bookingButton() {
      return Container(
        height: 45,
        width: 180,
        margin: const EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: (){
            handleProcessBooking();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green
          ),
          child: const Text(
            "Konfirmasi Pemesanan",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Konfirmasi'),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(20),
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nama Pemesan',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10,),
              Text(
                booking.nama.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Paket Wisata',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10,),
              Text(
                booking.paket_wisata.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Tanggal Perjalanan',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10,),
              Text(
                booking.tgl_perjalanan.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Metode Pembayaran',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10,),
              Text(
                booking.metode_pembayaran.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Harga',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10,),
              Text(
                "Rp${booking.harga.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              Text('Invoice: ${booking.invoice.toString()}'),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  bookingButton(),
                ],
              ),
              
            ],
          ),
        ),
      )
    );
  }
}