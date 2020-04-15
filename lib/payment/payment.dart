import 'package:flutter/material.dart';
import 'package:sispendik/payment/book_payment.dart';
import 'package:sispendik/payment/payment_spp.dart';
import 'package:sispendik/payment/uang_gedung.dart';
import 'package:sispendik/ui/bottomSheetSpp.dart';
import 'package:sispendik/ui/bottomSheetUangGedung.dart';

class Payment extends StatefulWidget {
  static const String id = 'paymentScreen';
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String dropdownvalue = "SPP";
  double heightCard = 100;
  bool januari = false;
  bool februari = false;
  bool maret = false;
  bool april = false;
  bool mei = false;
  bool juni = false;
  bool juli = false;
  bool agustus = false;
  bool september = false;
  bool oktober = false;
  bool november = false;
  bool desember = false;

  void _settingPaymentBuku(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(heightFactor: 0.8, child: BookPayment());
        });
  }

  void _settingPaymentUangGedung(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext contect) {
          return FractionallySizedBox(
            heightFactor: 0.73,
            child: BottomSheetUangGedung()
          );
        });
  }

  void _settingPaymentSpp(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.73,
            child: BottomSheetSpp(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("PILIH JENIS PEMBAYARAN"),
        ),
        body: GridView.count(
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                elevation: 8,
                animationDuration: Duration(seconds: 1),
                splashColor: Colors.blue[100],
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                color: Colors.white,
                textColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "image/calendar.png",
                      scale: 8,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "SPP",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                onPressed: () {
                  _settingPaymentSpp(context);
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                elevation: 8,
                animationDuration: Duration(seconds: 1),
                splashColor: Colors.blue[100],
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                color: Colors.white,
                textColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "image/building.png",
                      scale: 7,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "UANG GEDUNG",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                onPressed: () {
                  _settingPaymentUangGedung(context);
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                elevation: 8,
                animationDuration: Duration(seconds: 1),
                splashColor: Colors.blue[100],
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                color: Colors.white,
                textColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "image/books.png",
                      scale: 7,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "BUKU",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    _settingPaymentBuku(context);
                  });
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                elevation: 8,
                animationDuration: Duration(seconds: 1),
                splashColor: Colors.blue[100],
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                color: Colors.white,
                textColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "image/worldwide.png",
                      scale: 7,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "STUDY TOUR",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                elevation: 8,
                animationDuration: Duration(seconds: 1),
                splashColor: Colors.blue[100],
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                color: Colors.white,
                textColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "image/bank.png",
                      scale: 7,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "INFAQ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                elevation: 8,
                animationDuration: Duration(seconds: 1),
                splashColor: Colors.blue[100],
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                color: Colors.white,
                textColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "image/others.png",
                      scale: 4,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "LAINYA",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ],
        ));
  }
}

