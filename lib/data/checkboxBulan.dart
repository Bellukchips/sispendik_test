import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sispendik/constranst.dart';

class CheckBoxBulan extends StatelessWidget {
  final String title;
  final Function checkBoxCallBack;
  final bool value;
  final String price;

  CheckBoxBulan({this.title, this.value, this.checkBoxCallBack, this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: styleTextDefaultBlack.copyWith(
            decoration: value ? TextDecoration.lineThrough : null),
      ),
      trailing: Text(
        "Rp. $price",
        style: styleTextDefaultBlack,
      ),
      leading: Checkbox(
        onChanged: checkBoxCallBack,
        value: value,
      ),
    );
  }
}
