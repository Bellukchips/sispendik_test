import 'package:flutter/material.dart';
import 'package:sispendik/constranst.dart';

class PaymentSppOTS extends StatefulWidget {
  static const String id = 'paymentSpp';
  @override
  _PaymentSppOTSState createState() => _PaymentSppOTSState();
}

class _PaymentSppOTSState extends State<PaymentSppOTS> {
  Future<bool> showImage() {
    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Container(
            width: 200,
            child: new AlertDialog(
              content: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset("image/barcode_example.png")),
            ),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("SCAN QR CODE"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "TUNJUKAN QR CODE PADA PETUGAS",
              style: styleTextBigBlack,textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showImage();
              },
              child: Material(
                  elevation: 5,
                  child: Image.asset("image/barcode_example.png")),
            )
          ],
        ),
      ),
    );
  }
}
