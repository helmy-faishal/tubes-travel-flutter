import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/pages/user/footer.dart';
import 'package:tubes_travel_flutter/pages/user/header.dart';

Color btnColor = const Color(0xffEAB500);
Color textLinknColor = const Color(0xff1F35F9);
Color bgHeaderColor = const Color(0xff393D40);

class RegisterPage extends StatelessWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget usernameFormField() {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: "Username",
            labelText: "Username"
          ),
        )
      );
    }

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

    Widget registerButton() {
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
            "Daftar",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    Widget toLogin() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            const Text("Sudah Memiliki Akun? "),
            GestureDetector(
              onTap: () => Navigator.pop(context) ,
              child: Text("Login",style: TextStyle(color: textLinknColor),),
            )
          ],
        )
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                children:  [
                  usernameFormField(),
                  emailFormField(),
                  passwordFormField(),
                  registerButton(),
                  toLogin(),
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