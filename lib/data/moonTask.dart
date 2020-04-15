import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sispendik/data/bulan.dart';
import 'package:sispendik/data/checkboxBulan.dart';
import 'package:sispendik/data/list_spp.dart';


class MoonTask extends StatelessWidget {
  List<ListPaymentSpp>data = [];
  var taskSpp;

  @override
  Widget build(BuildContext context) {
    return Consumer<BulanData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return CheckBoxBulan(
              title: task.name,
              value: task.isDone,
              checkBoxCallBack: (value) {
                taskData.updateTask(task);
              },
            price: task.price,
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}


//return Consumer<BulanData>(
//builder: (context, taskData, child) {
//return ListView.builder(
//scrollDirection: Axis.vertical,
//itemBuilder: (context, index) {
//final task = taskData.moon[index];
//return Column(
//children: <Widget>[
//SizedBox(
//height: 20,
//),
//Padding(
//padding: const EdgeInsets.only(left: 10),
//child: Text(
//"TAGIHAN BULANAN",
//style: styleTextSmallBlack,
//),
//),
//CheckBoxBulan(
//title: task.name,
//value: task.isDone,
//checkBoxCallBack: (value) {
//taskData.updateTask(task);
//},
//),
//Divider(
//color: Colors.black54,
//),
//SizedBox(
//height: 10,
//),
//Text(
//"==========Total==========",
//style: styleTextDefaultBlack.copyWith(
//fontSize: 20, fontWeight: FontWeight.bold),
//textAlign: TextAlign.center,
//),
//SizedBox(
//height: 10,
//),
//Padding(
//padding: const EdgeInsets.only(left: 40),
//child: Text(
//"Bulan : ",
//style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//),
//),
//Container(
//padding: EdgeInsets.only(left: 20, top: 10, right: 20),
//child: Column(
//children: <Widget>[
//Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: <Widget>[
//Text(
//"- Januari",
//style: TextStyle(fontSize: 15),
//),
//Text(": Rp.200.000")
//],
//),
//SizedBox(
//height: 15,
//),
//Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: <Widget>[
//Text(
//"- Februari",
//style: TextStyle(fontSize: 15),
//),
//Text(": Rp.200.000")
//],
//),
//SizedBox(
//height: 15,
//),
//Divider(
//color: Colors.black87,
//),
//Padding(
//padding: const EdgeInsets.only(left: 20),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: <Widget>[
//Text("Total : "),
//Text(": Rp.400.000")
//],
//),
//)
//],
//),
//),
//Padding(
//padding: const EdgeInsets.only(top: 182),
//child: RaisedButton(
//animationDuration: Duration(seconds: 1),
//splashColor: Colors.blue[100],
//padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//color: Colors.lightBlue,
//textColor: Colors.white,
//child: Text(
//"Lanjutkan Pembayaran",
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//fontSize: 20),
//),
//onPressed: () {
//Navigator.pop(context);
//Navigator.push(context,
//MaterialPageRoute(builder: (e) => SelectionPayment()));
//},
//),
//),
//],
//);
//},
//itemCount: taskData.moonCount,
//);
//},
//);