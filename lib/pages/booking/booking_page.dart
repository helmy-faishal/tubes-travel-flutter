import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingPage'),
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            if (userProvider.isLoggedIn){
              Navigator.pushNamed(context, '/paket/booking');
            } else {
              Navigator.pushNamed(context, '/login');
            }
          }, 
          child: Text('Ke Booking')
        )
      ),
    );
  }
}