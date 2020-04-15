import 'package:flutter/material.dart';
import 'package:sispendik/API/ServiceUrl.dart';
import 'package:sispendik/constranst.dart';
import 'package:sispendik/payment/payment.dart';
import 'package:sispendik/screen/cardHomeScreen.dart';

class HomeMenu extends StatefulWidget {
  final String image;
  final String name;

  HomeMenu({this.name, this.image});
  static const String id  = 'homeMenuScreen';

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  var placeholder = Image.asset(
    "image/user.png",
    scale: 7,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue[500],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))
                  // gradient: LinearGradient(
                  //     begin: Alignment.bottomLeft,
                  //     end: Alignment.topRight,
                  //     colors: [Colors.blue[300], Colors.blue[400]])
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 30),
              child: Row(
                children: <Widget>[
                  if (widget.image.isEmpty)
                    placeholder
                  else
                    Hero(
                      tag: 'profile',
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            ApiService.showImage + widget.image,
                            scale: 10,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          )),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hai..! Selamat Datang",
                          style: styleTextSmallWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "${widget.name}",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CardHomeScreen()
          ],
        ),
      ],
    );
  }
}
