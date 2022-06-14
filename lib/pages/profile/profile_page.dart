import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/models/user_model.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    UserModel user;

    if (userProvider.isLoggedIn){
      user = userProvider.user;
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(userProvider.isLoggedIn? "User : ${userProvider.user.username.toString()}" : 'Belum Login'),
          Center(
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
              ),
          ),
        ],
      ),
    );
  }
}