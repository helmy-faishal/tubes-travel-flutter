import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/blog/blog_page.dart';
import 'package:tubes_travel_flutter/pages/booking/booking_confirmation_page.dart';
import 'package:tubes_travel_flutter/pages/booking/booking_form_page.dart';
import 'package:tubes_travel_flutter/pages/booking/booking_page.dart';
import 'package:tubes_travel_flutter/pages/homepage/homepage.dart';
import 'package:tubes_travel_flutter/pages/profile/booking_history.dart';
import 'package:tubes_travel_flutter/pages/profile/profile_page.dart';
// import 'package:tubes_travel_flutter/pages/blog/tab_blog_page.dart';
import 'package:tubes_travel_flutter/pages/splash_screen.dart';
import 'package:tubes_travel_flutter/pages/user/login_form.dart';
import 'package:tubes_travel_flutter/pages/user/register_form.dart';
import 'package:tubes_travel_flutter/provider/blog_provider.dart';
import 'package:tubes_travel_flutter/provider/booking_provider.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UserProvider()),
        ChangeNotifierProvider(create: (context)=>BlogProvider()),
        ChangeNotifierProvider(create: (context)=>BookingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/login' :(context) => const LoginPage(),
          '/register' :(context) => const RegisterPage(),
          '/homepage' :(context) => const HomePage(),
          '/blog' : (context) => const BlogPage(),
          '/paket' :(context) => const BookingPage(),
          '/paket/booking' : (context) => const BookingFormPage(),
          '/paket/booking/konfirmasi' :(context) => const BookingConfirmation(),
          '/profile' :(context) => const ProfilePage(),
          '/profile/booking' :(context) => const BookingHistory(), 
        },
        home: const Scaffold(
          body: SafeArea(
            child: SplashScreen(),
          ),
        ),
      ),
    );
  }
}