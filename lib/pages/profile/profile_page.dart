import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    handleLogout() async {
      await userProvider.logout();
    }

    Widget nonLoggedInPage(){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Belum Login'),
          Center(
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
              ),
          ),
        ],
      );
    }

    Widget loggedInPage(){
      return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${userProvider.user.username.toString()}'),
            const SizedBox(height: 15,),
            Text('Email: ${userProvider.user.email.toString()}'),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                handleLogout();
              },
              child: const Text('Logout')
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: userProvider.isLoggedIn? loggedInPage() : nonLoggedInPage()
    );
  }
}