import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    Widget paketSolo(){
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Solo Traveller',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
            const SizedBox(height: 15,),
            const Text(
              "Menjelajahi Banjarnegara karena keunikannya akan menjadi sebuah pengalaman yang berharga."
            ),
            const SizedBox(height: 10,),
            const Text(
              "Harga : Rp. 2.500.000/ 4 orang.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            const Text(
              "3 hari 2 malam",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/hotelBSY.jpg',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Hotel Surya Yudha",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/bukitSkuter.jpg',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Bukit Skuter, Dieng",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Bersantai di pagi hari atau menjelang sunset akan merilekskan pikiran.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/curugPitu.jpg',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Curug Pitu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Akan terasa sangat menyegarkan bermain air di dekat air terjun.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/sikunir.png',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Bukit Sikunir, Dieng",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Nikmati sunrise Bukit Sikunir dan panorama yang memanjakan mata.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget paketDuo(){
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Honeymoond in Blue Sky',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
            const SizedBox(height: 15,),
            const Text(
              "Paket liburan yang cocok dinikmati bersama pasangan, menikmati indahnya Banjarnegara bersama yang terkasih"
            ),
            const SizedBox(height: 10,),
            const Text(
              "Harga : Rp. 1.500.000/ 2 orang",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            const Text(
              "2 hari 1 malam",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/centralHotel.png',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Central Hotel",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/sikunir.png',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Bukit Sikunir, Dieng",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Nikmati sunrise Bukit Sikunir dan panorama yang memanjakan mata.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/curugMrawu.png',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Curug Mrawu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Air yang menyegarkan dan udara yang sejuk membuat diri menjadi tenang dan rileks..",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget paketFamily(){
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fun Family Vocation',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
            const SizedBox(height: 15,),
            const Text(
              "Liburan keluarga memang waktu yang dinanti - nanti, jangan lewatkan kesempatan itu."
            ),
            const SizedBox(height: 10,),
            const Text(
              "Harga : Rp. 2.500.000/ 4 orang",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            const Text(
              "3 hari 2 malam",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/AsriHotel.png',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Asri Hotel",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/candiArjuna.png',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Candi Arjuna",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Objek wisata yang menyenangkan dan mengandung nilai - nilai sejarah.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xffEED991),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/paket_wisata/sungaiSerayu.png',
                          width: 150,
                          height: 190,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Sungai Serayu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Sungai Serayu terkenal dengan airnya yang bersih dan tempat yang cocok untuk wisata arung jeram.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget bookingButton(){
      return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12)
        ),
        child: TextButton(
          onPressed: (){
            if (userProvider.isLoggedIn) {
              Navigator.pushNamed(context, '/paket/booking');
            } else {
              Navigator.pushNamed(context, '/login');
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green
          ),
          child: const Text(
            "Pesan Sekarang",
            style: TextStyle(color: Colors.white),
          ),
        )
      );
    }

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Paket Wisata'),
            bottom: const TabBar(
              tabs:  [
                Tab(text: 'Solo',),
                Tab(text: 'Duo',),
                Tab(text: 'Family',),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavbar(),
          
          body: TabBarView(
            children: [
              ListView(
                children: [
                  paketSolo(),
                  const Spacer(),
                  bookingButton(),
                ],
              ),
              ListView(
                children: [
                  paketDuo(),
                  const Spacer(),
                  bookingButton(),
                ],
              ),
              ListView(
                children: [
                  paketFamily(),
                  const Spacer(),
                  bookingButton(),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}