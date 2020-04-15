import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:sispendik/data/checkListBulan.dart';


class BulanData extends ChangeNotifier{
  List<CheckListBulan> _tasks =[
    CheckListBulan(name: "Januari",price: "200.000"),
    CheckListBulan(name: "Februari",price: "200.000"),
    CheckListBulan(name: "Maret",price: "200.000"),
    CheckListBulan(name: "April",price: "200.000"),
    CheckListBulan(name: "Mei",price: "200.000"),
    CheckListBulan(name: "Juni",price: "200.000"),
    CheckListBulan(name: "Juli",price: "200.000"),
    CheckListBulan(name: "Agustus",price: "200.000"),
    CheckListBulan(name: "September",price: "200.000"),
    CheckListBulan(name: "Oktober",price: "200.000"),
    CheckListBulan(name: "November",price: "200.000"),
    CheckListBulan(name: "Desember",price: "200.000"),
  ];
  UnmodifiableListView<CheckListBulan> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = CheckListBulan(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(CheckListBulan task) {
    task.toggleDone();
    notifyListeners();
  }

//  void deleteTask(CheckListBulan task) {
//    _tasks.remove(task);
//    notifyListeners();
//  }
}