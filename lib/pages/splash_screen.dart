import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/provider/blog_provider.dart';

Color bgColor = const Color(0xff393D40);

void main() => runApp(const SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    // getInit();
    
    Timer(const Duration(seconds: 5), (){
      Navigator.pushReplacementNamed(context, '/homepage');
    });

    super.initState();
  }

  getInit() async {
    await Provider.of<BlogProvider>(context,listen: false).getDestination();
    Navigator.pushReplacementNamed(context, '/homepage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Image.asset(
          "assets/big_logo.png",
          height: 150,
        )
      ),
    );
  }
}

