import 'package:flutter/material.dart';
import 'package:sispendik/payment/payment.dart';

class CardHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 170, left: 20, right: 20),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconTransaksi(icon: Icons.payment,title: "Bayar",onTap: (){
                  Navigator.pushNamed(context, Payment.id);
                },),
                IconTransaksi(icon: Icons.attach_money,title: "Tunggakan",),
                IconTransaksi(icon: Icons.history,title: "Riwayat",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconTransaksi extends StatefulWidget {
  final Function onTap;
  final IconData icon;
  final String title;

  IconTransaksi({this.title, this.icon, this.onTap});

  @override
  _IconTransaksiState createState() => _IconTransaksiState();
}

class _IconTransaksiState extends State<IconTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(widget.icon,size: 30,),
            iconSize: 40,
            onPressed: widget.onTap,
          ),
          Text(widget.title)
        ],
      ),
    );
  }
}
