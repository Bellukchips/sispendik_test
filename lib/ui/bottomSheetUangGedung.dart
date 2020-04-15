import 'package:flutter/material.dart';
import 'package:sispendik/payment/uang_gedung.dart';
import 'package:sispendik/screen/selectedPayment.dart';

class BottomSheetUangGedung extends StatefulWidget {
  @override
  _BottomSheetUangGedungState createState() => _BottomSheetUangGedungState();
}

class _BottomSheetUangGedungState extends State<BottomSheetUangGedung> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UANG GEDUNG'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("- TERBAYARKAN"),
                Text(": Rp.600.000 "),
              ],
            ),
            Divider(
              color: Colors.black87,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: Text(
                "TAGIHAN :",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("- UANG GEDUNG"),
                Text(": Rp.400.000 "),
              ],
            ),
            Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Nominal Pembayaran",
                          labelText: "Nominal Pembayaran",
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 30,),
            RaisedButton(
              animationDuration: Duration(seconds: 1),
              splashColor: Colors.blue[100],
              padding: EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 24.0),
              color: Colors.lightBlue,
              textColor: Colors.white,
              child: Text(
                "Lanjutkan Pembayaran",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (e) => SelectionPayment()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:   RaisedButton(
        elevation: 8,
        animationDuration: Duration(seconds: 1),
        splashColor: Colors.blue[100],
        padding:
        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        color: Colors.grey[500],
        textColor: Colors.white,
        child: Text(
          "Batalkan Pembayaran",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
