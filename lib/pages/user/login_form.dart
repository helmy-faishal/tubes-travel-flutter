import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/pages/user/footer.dart';
import 'package:tubes_travel_flutter/pages/user/header.dart';

Color btnColor = const Color(0xffEAB500);
Color textLinkColor = const Color(0xff1F35F9);
Color bgHeaderColor = const Color(0xff393D40);

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget emailFormField() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: "Email",
            labelText: "Email"
          ),
        )
      );
    }

    Widget passwordFormField() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: "Password",
            labelText: "Password"
          ),
        )
      );
    }

    Widget loginButton() {
      return Container(
        height: 45,
        width: 150,
        margin: const EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: (){
            Navigator.pushNamed(context, '/blog');
          },
          style: TextButton.styleFrom(
            backgroundColor: btnColor
          ),
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    Widget toRegister() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            const Text("Belum punya akun? "),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/register"),
              child: Text("Daftar",style: TextStyle(color: textLinkColor),),
            )
          ],
        )
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: bgHeaderColor,
        ),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            const Header(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  emailFormField(),
                  passwordFormField(),
                  loginButton(),
                  toRegister(),
                ],
              ),
            ),
            const Spacer(),
            const Footer()
          ]
        ),
      ),
    );
  }
}