import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/provider/blog_provider.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({ Key? key }) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  List routes = [
    '/homepage',
    '/blog',
    '/booking',
    '/profile'
  ];

  void _onItemTapped(int index) {
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(Icons.backpack),
          label: "Booking"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile"
        ),
      ],
    
      currentIndex: routes.indexOf(ModalRoute.of(context)!.settings.name),
      onTap: _onItemTapped,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}