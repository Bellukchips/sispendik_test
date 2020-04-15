import 'package:flutter/material.dart';

import '../constranst.dart';

class SppTask extends StatelessWidget {
  final String bulan;
  final String price;

  SppTask({this.bulan, this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("- $bulan", style: styleTextDefaultBlack),
        trailing: Text(
          "Rp. $price",
          style: styleTextDefaultBlack,
        ));
  }
}
