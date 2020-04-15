import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sispendik/data/list_spp.dart';
import 'package:sispendik/data/sppTask.dart';

class CheckListSpp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListPaymentSpp>(builder: (context,spp,child){
      return ListView.builder(itemBuilder: (context,index){
        final data = spp.task[index];
        return SppTask(
          bulan: data.name,
          price: data.price,
        );
      });
    });
  }
}
