import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/models/booking_model.dart';
import 'package:tubes_travel_flutter/provider/booking_provider.dart';
import 'package:tubes_travel_flutter/provider/user_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({ Key? key ,required this.data}) : super(key: key);
  
  final BookingModel data;

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {

  var format = DateFormat('y-MM-dd');

  DateTime _selectedTanggal = DateTime(1990);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    if (_selectedTanggal == DateTime(1990)){
      setState(() {
        _selectedTanggal = DateTime.parse(widget.data.tgl_perjalanan.toString());
      });
    }

    handleDelete() async {
      var _token = userProvider.user.token.toString();
      if (await BookingProvider().deleteBooking(widget.data, _token)){
        Navigator.pushReplacementNamed(context, '/profile/booking');
      }
    }

    handleReschedule() async {
      var _token = userProvider.user.token.toString();
      if (await BookingProvider().reschedule(widget.data, _token, _selectedTanggal.toString())) {
        Navigator.pushReplacementNamed(context, '/profile/booking');
      }
    }

    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        shadowColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.paket_wisata.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10,),
                      const Text("Pemesan: "),
                      Text(
                        widget.data.nama.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: 10,),
                      Text(
                        widget.data.tgl_perjalanan.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  _selectedTanggal.isBefore(DateTime.now()) ?  const Text(""):
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 200,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white70, 
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Reschedule Tanggal Perjalanan"),
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
                                    const Spacer(),
                                    Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          handleReschedule();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 40,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.yellowAccent[400],
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Ubah',
                                              style: TextStyle(
                                                color: Colors.black
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 85,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent[400],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]
                      ),
                      child: const Center(
                        child: Text(
                          "Reschedule",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    )
                  ),
                  const SizedBox(height: 20,),
                  _selectedTanggal.isBefore(DateTime.now()) ?  const Text(""):
                  GestureDetector(
                    onTap: (){
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Peringatan",
                        desc: "Apakah anda yakin ingin melakukan pembatalan?",
                        buttons: [
                          DialogButton(
                            child: const Center(
                              child: Text(
                                "Batalkan Pemesanan",
                                style: TextStyle(color: Colors.white),
                                )
                              ), 
                            onPressed: (){
                              handleDelete();
                            },
                            width: 180,
                            color: Colors.red[700],
                          )
                        ]
                      ).show();
                      // showDialog(
                      //   context: context,
                      //   builder: (context){
                      //     return Dialog(
                      //       child: Container(
                      //         padding: const EdgeInsets.all(20),
                      //         height: 180,
                      //         child: Column(
                      //           children: [
                      //             const Text(
                      //               "Apakah anda yakin ingin melakukan pembatalan?",
                      //               style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 20
                      //               ),
                      //               overflow: TextOverflow.clip,
                      //               textAlign: TextAlign.center,
                      //             ),
                      //             const Spacer(),
                      //             Container(
                      //               width: 170,
                      //               height: 30,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.red[700],
                      //                 borderRadius: BorderRadius.circular(12)
                      //               ),
                      //               child: TextButton(
                      //                 onPressed: () {
                      //                   handleDelete();
                      //                 },
                      //                 child: const Text(
                      //                   'Batalkan Pesanan',
                      //                   style: TextStyle(color: Colors.white),
                      //                 )
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     );
                      //   }
                      // );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 85,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]
                      ),
                      child: const Center(
                        child: Text(
                          "Batalkan",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    )
                  ),
                ],
              ),
              const SizedBox(width: 15,)
            ],
          ),
        ),
      ),
    );
  }
}