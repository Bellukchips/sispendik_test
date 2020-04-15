import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sispendik/API/ServiceUrl.dart';
import 'package:path/path.dart' as path;
import 'package:sispendik/constranst.dart';

class UpdateProfile extends StatefulWidget {
  static const String id = 'updateProfile';
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  //definition variable
  TextEditingController name;
  TextEditingController user;
  double width = 500;
  File _image;
  CircularProgressIndicator loading =
      CircularProgressIndicator(backgroundColor: Colors.white);
  Text titleButton = Text("SIMPAN", style: TextStyle(color: Colors.blue[900]));
  bool crossWidget = false;
  final _key = GlobalKey<FormState>();
  var nama = "", username = "", image = "";

  //open gallery
  openGalery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 1920.0, maxWidth: 1080.0);
    setState(() {
      _image = image;
      updateProfile();
    });
  }

  openCamera() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 1920.0, maxWidth: 1080.0);
    setState(() {
      _image = image;
      updateProfile();
    });
  }

  getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = preferences.getString("nama");
      username = preferences.getString("username");
      name = TextEditingController(text: "$nama");
      user = TextEditingController(text: "$username");
      image = preferences.getString("image");
    });
  }

  //function snackbar
  final _globalKey = new GlobalKey<ScaffoldState>();

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

  checkUpdate() {
    final form = _key.currentState;
    setState(() {
      if (width == 500) {
        width = 100;
        crossWidget = true;
        if (form.validate()) {
          form.save();
          updateData();
        } else {
          width = 500;
          crossWidget = false;
        }
      } else if (width == 100) {
        width = 500;
        crossWidget = false;
      }
    });
  }

  Future<bool> alertSelection() {
    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Container(
            width: 200,
            child: new AlertDialog(
              content: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      child: Image.asset(
                        "image/camera.png",
                        scale: 3,
                      ),
                      onTap: () {
                        openCamera();
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
                    InkWell(
                      child: Image.asset(
                        "image/gallery.png",
                        scale: 3,
                      ),
                      onTap: () {
                        openGalery();
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ) ??
        false;
  }

  //upload image profile
  updateProfile() async {
    try {
      var stream = http.ByteStream(DelegatingStream.typed(_image.openRead()));
      var length = await _image.length();
      var uri = Uri.parse(ApiService.update_profil);
      var request = http.MultipartRequest("POST", uri);
      // request.fields['nama'] = nameNew;
      request.fields['username'] = username;
      request.files.add(http.MultipartFile("image", stream, length,
          filename: path.basename(_image.path)));
      var response = await request.send();
      if (response.statusCode > 2) {
        print("Image upload");
        setState(() {
          _snackbar("Profile successfuly changed");
          // width = 500;
          // crossWidget = false;
        });
      } else {
        print("image failed");
        setState(() {
          _snackbar("changed profile failed");
          // width = 500;
          // crossWidget = false;
        });
      }
    } catch (e) {
      debugPrint("Error $e");
      _snackbar("profile is not changed");
      setState(() {
        // width = 500;
        // crossWidget = false;
      });
    }
  }

//update data profil
  updateData() async {
    final response = await http.post(ApiService.update_profile, body: {
      "username": username,
      "nama": nama,
    });
    final result = jsonDecode(response.body);
    var success = result['success'];
    var message = result['message'];
    if (success == 0) {
      setState(() {
        _snackbar(message);
        width = 500;
        crossWidget = false;
      });
    } else {
      setState(() {
        _snackbar(message);
        width = 500;
        crossWidget = false;
      });
    }
  }

  Widget bottomSheet() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Image.asset(
                "image/camera.png",
                scale: 3,
              ),
              onTap: () {
                openCamera();
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: Image.asset(
                "image/gallery.png",
                scale: 3,
              ),
              onTap: () {
                openGalery();
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var placeholder = Image.asset(
      "image/user.png",
      scale: 7,
    );

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Ubah Profile"),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    if (_image == null && image.isEmpty)
                      placeholder
                    else if (_image != null && image.isEmpty)
                     Hero(tag: 'profile', child:  ClipRRect(
                         borderRadius: BorderRadius.circular(50),
                         child: Image.file(
                           _image,
                           scale: 10,
                           fit: BoxFit.cover,
                           width: 90,
                           height: 90,
                         )))
                    else if (_image == null && image.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          ApiService.showImage + image,
                          scale: 10,
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      )
                    else if (image.isNotEmpty && _image != null)
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image,
                            scale: 10,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          )),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => bottomSheet());
                        },
                        child: Text(
                          "Ubah Foto Profile",
                          style: styleTextSmallWhite.copyWith(
                              color: Colors.lightBlue),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 40,
                  color: Colors.black45,
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        enabled: false,
                        onSaved: (e) => username = e,
                        controller: user,
                        decoration: InputDecoration(
                            hintText: "Nis/Nip", labelText: "Nis/Nip"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Name can't empty";
                          }
                        },
                        onSaved: (e) => nama = e,
                        controller: name,
                        decoration: InputDecoration(
                            hintText: "Nama", labelText: "Nama"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
        child: InkWell(
            onTap: () {
              checkUpdate();
            },
            child: AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 50,
                curve: Curves.easeInSine,
                width: width,
                alignment: FractionalOffset.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue[100],
                ),
                child: crossWidget ? loading : titleButton)),
      ),
    );
  }
}
