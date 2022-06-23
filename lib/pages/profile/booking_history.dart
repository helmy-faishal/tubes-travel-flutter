import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';
import 'package:tubes_travel_flutter/pages/profile/booking_card.dart';
import 'package:tubes_travel_flutter/provider/booking_provider.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);
    bookingProvider.getBookingData(userProvider.user.token.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Riwayat Pemesanan"),
        ),
        body: ListView(
          children: bookingProvider.listBooking.map((e) {
            return BookingCard(data: e);
          }).toList(),
        ),
      ),
    );
  }
}