class CheckListBulan{
  final String name;
  bool isDone;
  final String price;
  CheckListBulan({this.name,this.isDone = false,this.price});

  void toggleDone(){
    isDone = !isDone;
  }
}