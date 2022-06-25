import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/provider/booking_provider.dart';
import 'package:intl/intl.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';

Color btnColor = const Color(0xffEAB500);
Color textLinkColor = const Color(0xff1F35F9);
Color bgHeaderColor = const Color(0xff393D40);

class BookingFormPage extends StatefulWidget {
  const BookingFormPage({Key? key}) : super(key: key);

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final TextEditingController _namaController = TextEditingController(text: '###');

  final List<String> paketWisata = [
    'Solo Traveller',
    'Honeymoond in Blue Sky',
    'Fun Family Vacation'
  ];

  final Map<String, int> daftarHarga = {
    'Solo Traveller': 150000,
    'Honeymoond in Blue Sky': 150000,
    'Fun Family Vacation': 250000,
  };

  String _selectedPaket = 'Solo Traveller';

  final List<String> metodePembayaran = [
    'LinkAja',
    'Dana',
    'GoPay',
    'OVO',
  ];

  var format = DateFormat('y-MM-dd');

  String _selectedPembayaran = 'LinkAja';

  DateTime _selectedTanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    if (_namaController.text == "###") {
      setState(() {
        _namaController.text = userProvider.user.username.toString();
      });
    }

    handleBooking() async {
      if (_namaController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Nama harus diisi',
              textAlign: TextAlign.center,
            )));
      } else {
        await bookingProvider.getBooking(
          _namaController.text,
          _selectedPaket,
          format.format(_selectedTanggal),
          _selectedPembayaran,
          daftarHarga[_selectedPaket] ?? -1,
        );

        Navigator.pushNamed(context, '/paket/booking/konfirmasi');
      }
    }

    Widget nameFormField() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(12)
          ),
          child: TextFormField(
            controller: _namaController,
            decoration: const InputDecoration(
                hintText: "Masukkan Nama Pemesan", labelText: "Nama Pemesan"),
          ));
    }

    Widget pilihPaketWisata() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(12)
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pilih Paket Wisata"),
            DropdownButton(
                isExpanded: true,
                value: _selectedPaket,
                items: paketWisata
                    .map((paket) =>
                        DropdownMenuItem(value: paket, child: Text(paket)))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaket = value!;
                  });
                }),
          ],
        ),
      );
    }

    Widget pilihMetodePembayaran() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pilih Metode Pembayaran"),
            DropdownButton(
                isExpanded: true,
                value: _selectedPembayaran,
                items: metodePembayaran
                    .map((metode) =>
                        DropdownMenuItem(value: metode, child: Text(metode)))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedPembayaran = value!;
                  });
                }),
          ],
        ),
      );
    }

    _pilihTanggalPerjalanan() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white70, 
            borderRadius: BorderRadius.circular(12)
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pilih Tanggal Perjalanan"),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100], 
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    format.format(_selectedTanggal),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedTanggal,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2999),
                          helpText: "Pilih Tanggal Perjalanan",
                          cancelText: "Batalkan",
                          confirmText: "Pilih Tanggal",
                        );
                        if (picked != null) {
                          setState(() {
                            _selectedTanggal = picked;
                          });
                        }
                      },
                      child: const Icon(Icons.calendar_month)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget hargaPaket() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Harga: '),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Rp${daftarHarga[_selectedPaket].toString()}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    Widget bookingButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 45,
            width: 150,
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                handleBooking();
              },
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                "Pesan Sekarang",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Booking'),
          backgroundColor: bgHeaderColor,
        ),
        resizeToAvoidBottomInset: true,
        body: Column(children: [
          Container(
            color: Colors.grey[250],
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameFormField(),
                pilihPaketWisata(),
                pilihMetodePembayaran(),
                _pilihTanggalPerjalanan(),
                hargaPaket(),
                bookingButton(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
