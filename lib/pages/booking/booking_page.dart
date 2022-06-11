import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingPage'),
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: const Center(child: Text('Masih dalam pengembangan')),
    );
  }
}