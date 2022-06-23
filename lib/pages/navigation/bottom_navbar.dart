import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({ Key? key }) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  List routes = [
    '/homepage',
    '/blog',
    '/paket',
    '/profile'
  ];

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.travel_explore),
          label: "Blog"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flight_takeoff),
          label: "Paket Wisata"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile"
        ),
      ],
    
      currentIndex: routes.indexOf(ModalRoute.of(context)!.settings.name),
      onTap: (index){
        if (index == 3 && !userProvider.isLoggedIn) {
          Navigator.pushNamed(context, '/login');
        } else {
          Navigator.pushReplacementNamed(context, routes[index]);
        }
      },
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}