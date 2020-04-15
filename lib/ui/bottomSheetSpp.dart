import 'package:flutter/material.dart';
import 'package:sispendik/constranst.dart';
import 'package:sispendik/data/checkListBulan.dart';
import 'package:sispendik/data/moonTask.dart';
import 'package:sispendik/screen/selectedPayment.dart';

class BottomSheetSpp extends StatefulWidget {
  @override
  _BottomSheetSppState createState() => _BottomSheetSppState();
}

class _BottomSheetSppState extends State<BottomSheetSpp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "PEMBAYARAN SPP",
          style: styleTextDefaultWhite,
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child:ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "TAGIHAN BULANAN",
                style: styleTextSmallBlack,
              ),
            ),
            moonTask,
            Divider(
              color: Colors.black54,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "==========Total==========",
              style: styleTextDefaultBlack.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                "Bulan : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.black87,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Total : "),
                        Text(": Rp.400.000")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 182),
              child: RaisedButton(
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
                      MaterialPageRoute(builder: (e) =>
                          SelectionPayment()));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FlatButton(
        splashColor: Colors.blue[100],
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        color: Colors.grey[500],
        textColor: Colors.white,
        child: Text(
          "Batalkan Pembayaran",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

Widget moonTask =Container(
  child: Container(
      height: 160, child: Stack(children: <Widget>[MoonTask()])),
);
