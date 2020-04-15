import 'package:flutter/material.dart';
import 'package:sispendik/constranst.dart';
import 'package:sispendik/payment/payment_spp.dart';

class SelectionPayment extends StatefulWidget {
  @override
  _SelectionPaymentState createState() => _SelectionPaymentState();
}

class _SelectionPaymentState extends State<SelectionPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Metode Pembayaran"),
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
                    "image/qr-code.png",
                    scale: 8,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "BAYAR DI TEMPAT",
                    style: styleTextDefaultBlack.copyWith(
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (e) => PaymentSppOTS()));
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
                    "image/bank-transfer.png",
                    scale: 7,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "TRANSFER",
                    style: styleTextDefaultBlack.copyWith(
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
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
                    "image/indomaret.png",
                    scale: 7,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "VIA INDOMARET",
                    style: styleTextDefaultBlack.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.center,
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
                    "image/alfamart.png",
                    scale: 7,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "VIA ALFAMART",
                    style: styleTextDefaultBlack.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                  )
                ],
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
