import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/user/footer.dart';
import 'package:tubes_travel_flutter/pages/user/header.dart';
import 'package:tubes_travel_flutter/pages/user/loading_button.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

Color btnColor = const Color(0xffEAB500);
Color textLinknColor = const Color(0xff1F35F9);
Color bgHeaderColor = const Color(0xff393D40);

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController(text: '');

  final TextEditingController _emailController = TextEditingController(text: '');

  final TextEditingController _passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    handleRegister() async {
      setState(() {
        isLoading = true;
      });

      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      if (await userProvider.register(username, email, password)) {
        Navigator.pushReplacementNamed(context, '/homepage'); 
      } else {
        bool anyEmptyField = username.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              anyEmptyField? 'Semua field harus diisi':'Gagal melakukan registrasi',
              textAlign: TextAlign.center,
            )
          )
        );

        setState(() {
          isLoading = false;
        });
      }
    }

    Widget usernameFormField() {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        child: TextFormField(
          controller: _usernameController,
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

    Widget registerButton() {
      return Container(
        height: 45,
        width: 150,
        margin: const EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: (){
            handleRegister();
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
          title: const Text('Daftar'),
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
                  isLoading? const LoadingButton():registerButton(),
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