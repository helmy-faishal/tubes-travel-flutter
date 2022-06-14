import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/user/footer.dart';
import 'package:tubes_travel_flutter/pages/user/header.dart';
import 'package:tubes_travel_flutter/pages/user/loading_button.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

Color btnColor = const Color(0xffEAB500);
Color textLinkColor = const Color(0xff1F35F9);
Color bgHeaderColor = const Color(0xff393D40);

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController(text: '');

  final TextEditingController _passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      String email = _emailController.text;
      String password = _passwordController.text;

      if (await userProvider.login(email, password)) {
        Navigator.pushReplacementNamed(context, '/homepage'); 
      } else {
        bool anyEmptyField = email.trim().isEmpty || password.trim().isEmpty;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              anyEmptyField? 'Semua field harus diisi':'Gagal melakukan login',
              textAlign: TextAlign.center,
            )
          )
        );

        setState(() {
          isLoading = false;
        });
      }
    }

    Widget emailFormField() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: _emailController,
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
          controller: _passwordController,
          obscureText: true,
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
            handleLogin();
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
                  isLoading? const LoadingButton() : loginButton(),
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