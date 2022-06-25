// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final TextEditingController _usernameController = TextEditingController(text: "Contoh Username");

  final TextEditingController _passwordController = TextEditingController(text: '');

  final TextEditingController _passwordLamaController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    setState(() {
      _usernameController.text = userProvider.user.username.toString();
    });

    handleLogout() async {
      await userProvider.logout();
      Navigator.pushNamedAndRemoveUntil(context, "/homepage", (route) => false);
    }

    handleUpdate() async {
      var username = _usernameController.text;
      var password_baru = _passwordController.text;
      var password_lama = _passwordLamaController.text;
      if (await userProvider.update(username, password_lama,password_baru)){
        Alert(
          context: context,
          type: AlertType.success,
          title: "Berhasil",
          desc: "Berhasil mengubah profil",
        ).show();
        Timer(const Duration(seconds: 1), (){
          Navigator.pushReplacementNamed(context, '/profile');
        });
      }
    }

    Widget headerImage(){
      return SizedBox(
        width:double.infinity,
        child: Image.asset(
          "assets/footer.png",
          height: 84,
        ),
      );
    }
    
    Widget usernameField(){
      return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        height:60,
        decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(userProvider.user.username.toString()),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return Dialog(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 180,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  hintText: "Username",
                                  labelText: "Username"
                                ),
                              )
                            ),
                            const SizedBox(height:20),
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: TextButton(
                                onPressed: () {
                                  handleUpdate();
                                },
                                child: const Text(
                                  'Ubah',
                                  style: TextStyle(color: Colors.black),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                );
              }, 
              icon: const Icon(Icons.edit)
            ),
          ],
        ),
      );
    }

    Widget emailField(){
      return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        height:60,
        decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.key),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const [
                    Text(
                      'Ubah Kata Sandi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Text(userProvider.user.email.toString()),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return Dialog(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 250,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: true,
                                controller: _passwordLamaController,
                                decoration: const InputDecoration(
                                  hintText: "Password Lama",
                                  labelText: "Password Lama"
                                ),
                              )
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  hintText: "Password Baru",
                                  labelText: "Password Baru"
                                ),
                              )
                            ),
                            const SizedBox(height:20),
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: TextButton(
                                onPressed: () {
                                  handleUpdate();
                                },
                                child: const Text(
                                  'Ubah',
                                  style: TextStyle(color: Colors.black),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                );
              }, 
              icon: const Icon(Icons.edit)
            ),
          ],
        ),
      );
    }

    Widget checkBooking(){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/profile/booking');
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          height:60,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: const [
              Icon(Icons.history),
              SizedBox(width: 10,),
              Text("Lihat Riwayat Pemesanan"),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      );
    }

    Widget logoutButton(){
      return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        height: 43,
        width: 390,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12)
        ),
        child: TextButton(
          onPressed: (){
            handleLogout();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red
          ),
          child: const Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ),
        )
      );
    }

    Widget loggedInPage(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerImage(),
          const SizedBox(
            height: 20,
          ),
          usernameField(),
          emailField(),
          checkBooking(),
          logoutButton(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: loggedInPage()
    );
  }
}