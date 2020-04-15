import 'package:flutter/material.dart';
import 'package:sispendik/API/ServiceUrl.dart';
import 'package:sispendik/main/updatePassword.dart';
import 'package:sispendik/main/updateProfile.dart';

class Account extends StatefulWidget {
  static const String id = "accountScreen";
  final Function signOut;
  final String image;
  final String name;
  final String username;
  final double width;
  final CircularProgressIndicator loading;
  final bool crossWidget;
  final Text titleButton;
  Account({this.image,this.name,this.username,this.width,this.crossWidget,this.titleButton,this.loading,this.signOut});


  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  signOut() {
    setState(() {
     // ignore: unnecessary_statements
     widget.signOut;
    });
  }

  var placeholder = Image.asset(
    "image/user.png",
    scale: 7,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Material(
            elevation: 20,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Stack(children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))
                  // gradient: LinearGradient(
                  //     begin: Alignment.bottomLeft,
                  //     end: Alignment.topRight,
                  //     colors: [Colors.blue[300], Colors.blue[400]])
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 50),
                child: Row(
                  children: <Widget>[
                    if (widget.image.isEmpty)
                      placeholder
                    else
                      Hero(tag: 'profile', child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            ApiService.showImage + widget.image,
                            scale: 10,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          )),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.username}",
                            style: TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Akun",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Divider(
                  color: Colors.black87,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (x) => UpdateProfile()));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.blue[300],
                    ),
                    title: Text("Ubah Profile"),
                    trailing: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.chevron_right),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (x) => UpdatePassword()));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      color: Colors.blue[300],
                    ),
                    title: Text("Ubah Password"),
                    trailing: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.chevron_right),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Tentang",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Divider(
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.assignment_turned_in,
                    color: Colors.blue[300],
                  ),
                  title: Text("Kebijakan Privasi"),
                  trailing: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.chevron_right),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Colors.blue[300],
                  ),
                  title: Text("Panduan SISPENDIK"),
                  trailing: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 30, top: 50, bottom: 20),
            child: InkWell(
                onTap: widget.signOut,
                child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    width: widget.width,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: widget.crossWidget ? widget.loading : widget.titleButton)),
          )
        ],
      ),
    );
  }
}
