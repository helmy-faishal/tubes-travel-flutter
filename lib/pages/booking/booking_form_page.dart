import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/provider/booking_provider.dart';
import 'package:intl/intl.dart';

Color btnColor = const Color(0xffEAB500);
Color textLinkColor = const Color(0xff1F35F9);
Color bgHeaderColor = const Color(0xff393D40);

class BookingFormPage extends StatefulWidget {
  const BookingFormPage({ Key? key }) : super(key: key);

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {

  final TextEditingController _namaController = TextEditingController(text: '');

  final List<String> paketWisata = [
    'Solo Traveller',
    'Fun Family Vacation'
  ];

  final Map<String,int> daftarHarga = {
    'Solo Traveller' : 150000,
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
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    handleBooking() async{
      if (_namaController.text.trim().isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Nama harus diisi',
              textAlign: TextAlign.center,
            )
          )
        );
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
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: _namaController,
          decoration: const InputDecoration(
            hintText: "Masukkan Nama Pemesan",
            labelText: "Nama Pemesan"
          ),
        )
      );
    }

    Widget pilihPaketWisata(){
      return DropdownButton(
        value: _selectedPaket,
        items: paketWisata.map(
          (paket) => DropdownMenuItem(
            value: paket,
            child: Text(paket)
          )
        ).toList(),
        onChanged: (String? value){
          setState(() {
            _selectedPaket = value!;
          });
        }
      );
    }

    Widget pilihMetodePembayaran(){
      return DropdownButton(
        value: _selectedPembayaran,
        items: metodePembayaran.map(
          (metode) => DropdownMenuItem(
            value: metode,
            child: Text(metode)
          )
        ).toList(),
        onChanged: (String? value){
          setState(() {
            _selectedPembayaran = value!;
          });
        }
      );
    }

    _pilihTanggalPerjalanan() {
      return Row(
        children: [
          const Text(
            "Tanggal dipilih:"
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            format.format(_selectedTanggal)
          ),
          const SizedBox(
            width: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _selectedTanggal,
                firstDate: _selectedTanggal,
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
            child: const Text('Pilih tanggal')
          ),
        ],
      );
    }

    Widget hargaPaket(){
      return Row(
        children: [
          const Text(
            'Harga: '
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Rp${daftarHarga[_selectedPaket].toString()}'
          ),
        ],
      );
    }

    Widget bookingButton() {
      return Container(
        height: 45,
        width: 150,
        margin: const EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: (){
            handleBooking();
          },
          style: TextButton.styleFrom(
            backgroundColor: btnColor
          ),
          child: const Text(
            "Pesan Sekarang",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Booking'),
          backgroundColor: bgHeaderColor,
        ),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Container(
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
          ]
        ),
      ),
    );
  }
}