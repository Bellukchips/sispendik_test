import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:sispendik/data/checkListBulan.dart';

class ListPaymentSpp extends ChangeNotifier{
  List<CheckListBulan> task = [];

  UnmodifiableListView<CheckListBulan> get _task{
    return UnmodifiableListView(task);
  }
  int get sppCount{
    return task.length;
  }
  void addSpp(String bulan, String price){
    final task = CheckListBulan(name: bulan,price: price);
    _task.add(task);
    notifyListeners();
  }
  void updateSpp(CheckListBulan bulan){
    bulan.toggleDone();
    notifyListeners();
  }
}


//
//import 'package:flutter/material.dart';
//
//class CheckListSpp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
//      children: <Widget>[
//        Text(
//          "- Januari",
//          style: TextStyle(fontSize: 15),
//        ),
//        Text(": Rp.200.000")
//      ],
//    );
//  }
//}
