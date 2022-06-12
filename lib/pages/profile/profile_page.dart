import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: (){
            Navigator.pushNamed(context, '/login');
          },
          ),
      ),
    );
  }
}