import 'package:flutter/material.dart';

Color bgColor = const Color(0xff393D40);
Color textColor = const Color(0xffD1D1D1);
void main() => runApp(const Header());

class Header extends StatelessWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      color: bgColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Image.asset(
              "assets/Logo.png",
              height: 55,
            )
          ),
          
          Container(
            margin: const EdgeInsets.only(top: 28, bottom: 22,left: 64,right: 64),
            child: Text(
              "Jelajahi Banjarnegara Bersama Kami",
              style: TextStyle(color: textColor),
              
            ),
          )
        ],
      ),
    );
  }
}

