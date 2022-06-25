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
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/logo-banjarnegara.png",
              height: 80,
              width: 80,
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
              child: ClipRRect(
                borderRadius:BorderRadius.circular(10),
                child: Image.asset(
                  "assets/homepage/kesan1.png",
                  height: 180,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]
        ),
      );
    }

    Widget kesan2(){
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
                    "Pengalaman Tak Terlupakan Saat Berkunjung ke Banjarnegara",
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                    "Banyak pengalaman menarik yang akan sulit anda lupakan ketika mengunjungi Banjarnegara. Tempat yang sangat indah untuk membuat kenangan bersama teman, pasangan atau keluarga. Tempat destinasi wisata yang ramah lingkungan bagi anak-anak.",
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/homepage/kesan2.jpg",
                  height: 180,
                  width: 140,
                  fit: BoxFit.cover,
                ),
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
            kesan2()
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
            const Text(
              "Dieng Culture Festival",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            const SizedBox(height: 15,),
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/homepage/slide1.jpg',
                      height: 450,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/homepage/slide2.jpg',
                      height: 450,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/homepage/slide3.jpg',
                      height: 450,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/homepage/alasan1.png',
                  height: 290,
                  fit: BoxFit.fitHeight,
                ),
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

    Widget alasan2(){
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/homepage/alasan2.jpg',
                  height: 290,
                  fit: BoxFit.fitHeight,
                ),
              ),
              alignment: Alignment.center,
            ),
            Container(
              child: const Text(
                "Aman",
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

    Widget alasan3(){
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/homepage/alasan3.jpg',
                  height: 290,
                  fit: BoxFit.fitHeight,
                ),
              ),
              alignment: Alignment.center,
            ),
            Container(
              child: const Text(
                "Terpercaya",
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
            const Text(
              'Kenapa Memilih Millenium Travel Agency?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  alasan1(),
                  alasan2(),
                  alasan3(),
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
          Navigator.pushReplacementNamed(context, '/paket');
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