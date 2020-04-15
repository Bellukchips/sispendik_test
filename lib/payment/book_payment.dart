import 'package:flutter/material.dart';


class BookPayment extends StatefulWidget {
  @override
  _BookPaymentState createState() => _BookPaymentState();
}

class _BookPaymentState extends State<BookPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("PEMBAYARAN BUKU"),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: null),
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "ex: Bahasa indonesia",
                            labelText: "ex: Bahasa indonesia",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.search), onPressed: null)),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}