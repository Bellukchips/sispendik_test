import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[100],
          highlightColor: Colors.grey[200],
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[500],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                gradient: LinearGradient(
                    colors: [Colors.grey[100], Colors.grey[200]],
                    end: Alignment.centerRight,
                    begin: Alignment.centerLeft)),
          )),
    );
  }
}
