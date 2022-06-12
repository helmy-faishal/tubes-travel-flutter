import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget tentangBanjarnegara(){
      return Container(
        height: 300,
        width: 390,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffBBB18F),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            const Text(
              "Banjarnegara merupakan sebuah Kabupaten yang terletak di Jawa Tengah, Kabupaten ini memiliki sejuta pesona dan panaroma alam yang menakjubkan dan masih banyak yang tersembunyi.",
              overflow: TextOverflow.clip,
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/logo-banjarnegara.png",
              height: 48,
              width: 60,
            )
          ],
        ),
      );
    }

    Widget kesan1(){
      return Container(
        height: 300,
        width: 400,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffBBB18F),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Column(
              children: const [
                SizedBox(
                  width: 200,
                  child: Text(
                    "Perjalanan yang Menyenangkan dan Akan Selalu Terkenang",
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 5,
                  height: 1,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    "Saat trip menuju wisata akan sangat menyenangkan. Kita akan melewati pemandangan yang sangat indah. Akses jalan menuju destinasi wisata juga sangat nyaman",
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/kesan1.png",
                height: 180,
                width: 140,
              ),
            ),
          ]
        ),
      );
    }

    

    Widget scrollKesan(){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            kesan1(),
            kesan1()
          ],
        ),
      );
    }

    Widget carouselDieng(){
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Dieng Culture Festival"),
            CarouselSlider(
              items: [
                Image.asset('assets/slide1.png'),
                Image.asset('assets/slide1.png'),
                Image.asset('assets/slide1.png'),
                Image.asset('assets/slide1.png'),
                
              ],
              options: CarouselOptions(
                autoPlay: true,
              )
            ),
          ],
        ),
      );
    }

    Widget alasan1(){
      return Container(
        width: 390,
        height: 300,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent
        ),
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                'assets/alasan1.png',
                fit: BoxFit.cover,
              ),
              alignment: Alignment.center,
            ),
            Container(
              child: const Text(
                "Murah",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              alignment: Alignment.center,
            )
          ],
        ),
      );
    }

    Widget scrollAlasan(){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Kenapa Memilih Millenium Travel Agency?'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  alasan1(),
                  alasan1(),
                  alasan1(),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget kePemesanan(){
      return GestureDetector(
        onTap: (){
          Navigator.pushReplacementNamed(context, '/booking');
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          height: 40,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffEAB500)
          ),
          child: const Center(
            child: Text('Pilih Paket Wisata'),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      bottomNavigationBar: const BottomNavbar(),
      body: ListView(
        children: [
          tentangBanjarnegara(),
          scrollKesan(),
          carouselDieng(),
          scrollAlasan(),
          kePemesanan(),
        ],
      ),
    );
  }
}