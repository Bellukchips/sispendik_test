import 'package:flutter/material.dart';

class UangGedung extends StatefulWidget {
  static const String id = 'uangGedung';
  @override
  _UangGedungState createState() => _UangGedungState();
}

class _UangGedungState extends State<UangGedung> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Methode Pembayaran"),
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
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (e)=>ScanQRUangGedung()));
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
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ), ClipRRect(
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
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ), ClipRRect(
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
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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


class ScanQRUangGedung extends StatefulWidget {
  @override
  _ScanQRUangGedungState createState() => _ScanQRUangGedungState();
}

class _ScanQRUangGedungState extends State<ScanQRUangGedung> {
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

