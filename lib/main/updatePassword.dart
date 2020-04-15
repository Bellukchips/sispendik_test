import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sispendik/API/ServiceUrl.dart';

class UpdatePassword extends StatefulWidget {
  static const String id = 'updatePassword';
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  String username, passwordOld, passwordNew;
  bool _secureTextlast = true;
  double width = 500;
  bool _secureText = true;
  Text titleButton = Text("UBAH PASSWORD", style: TextStyle(color: Colors.blue[900]));
  CircularProgressIndicator loading =
  CircularProgressIndicator(backgroundColor: Colors.white);
  bool crossWidget = false;

  //function snackbar
  final _globalKey = new GlobalKey<ScaffoldState>();
  final _key = new GlobalKey<FormState>();

  void _snackbar(String str) {
    _globalKey.currentState.showSnackBar(new SnackBar(
      content: Text(
        str,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  getPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
    });
  }

  validateForm() {
    final form = _key.currentState;
    setState(() {
      if(width == 500){
        width = 100;
        crossWidget = true;
        if(form.validate()){
          form.save();
          updatePassword();
        }else{
          width = 500;
          crossWidget = false;
        }
      }
    });

  }

  //update password
  updatePassword() async {
    final res = await http.post(ApiService.update_password, body: {
      "username": username,
      "passwordOld": passwordOld,
      "passwordNew": passwordNew
    });
    final result = jsonDecode(res.body);
    var success = result['success'];
    var message = result['message'];
    if (success == 1) {
      setState(() {
        width = 500;
        crossWidget= false;
        _snackbar(message);
      });
    } else {
      setState(() {
        _snackbar(message);
        crossWidget = false;
        width = 500;
      });
    }
  }

  //function hidden and show password
  // function hide password
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  showHideLast() {
    setState(() {
      _secureTextlast = !_secureTextlast;
    });
  }

  @override
  void initState() {
    getPreference();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("ID : $username "),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (e){
                  if(e.isEmpty){
                    return "Password old can't empty";
                  }
                },
                obscureText: _secureText,
                onSaved: (e) => passwordOld = e,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        showHide();
                      },
                      icon: Icon(_secureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    hintText: "Password Lama",
                    labelText: "Password Lama"),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(validator: (e){
                if(e.isEmpty){
                  return "Password new can't empty";
                }
              },
                onSaved: (e) => passwordNew = e,
                obscureText: _secureTextlast,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        showHideLast();
                      },
                      icon: Icon(_secureTextlast
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    hintText: "Password Baru",
                    labelText: "Password Baru"),
              ),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                    onTap: () {
                      validateForm();
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.bounceInOut,
                      height: 50,
                      width: width,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: crossWidget?loading:titleButton
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
