import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sispendik/API/ServiceUrl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sispendik/constranst.dart';
import 'package:sispendik/data/bulan.dart';
import 'package:sispendik/main/updatePassword.dart';
import 'package:sispendik/main/updateProfile.dart';
import 'package:sispendik/payment/payment.dart';
import 'package:sispendik/payment/payment_spp.dart';
import 'package:sispendik/payment/uang_gedung.dart';
import 'package:sispendik/screen/menuProfile.dart';

import 'screen/homeMenu.dart';

void main() {
  runApp(ChangeNotifierProvider(
    builder: (context) => BulanData(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginActivity(),
      title: "Sispendik",
      initialRoute: LoginActivity.id,
      routes: {
        LoginActivity.id: (context) => LoginActivity(),
        Account.id: (context) => Account(),
        HomeMenu.id: (context) => HomeMenu(),
        UpdatePassword.id: (context) => UpdatePassword(),
        UpdateProfile.id: (context) => UpdateProfile(),
        Payment.id: (context) => Payment(),
        PaymentSppOTS.id: (context) => PaymentSppOTS(),
        UangGedung.id: (context) => UangGedung(),
      },
    ),
  ));
}

class LoginActivity extends StatefulWidget {
  static const String id = "loginScreen";

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

enum LoginState { notSignIn, signIn }

class _LoginActivityState extends State<LoginActivity>
    with TickerProviderStateMixin {
  //declaration variable
  bool _secureText = true;
  bool _secureTextReg = true;
  bool dialog = false;
  double width = 200;
  double widthReg = 200;
  String userRegister, passwordRegister;
  bool crossWidget = false;
  bool crossWidgetReg = false;
  LoginState _loginstate = LoginState.notSignIn;
  TabController controller;
  final _key = new GlobalKey<FormState>();
  final _keyRegister = new GlobalKey<FormState>();
  Text signIn = Text("SIGN IN", style: TextStyle(color: Colors.white));
  Text titleReg = Text("REGISTER", style: TextStyle(color: Colors.white));
  CircularProgressIndicator loading =
      CircularProgressIndicator(backgroundColor: Colors.white);
  String username, password;
  int _currValue;
  Radio _radio = Radio();
  AnimationController controllerAnimasi;
  Animation animasi;

  //function orientation screen off
  @override
  void initState() {
    // TODO: implement initState
    controllerAnimasi =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animasi =
        CurvedAnimation(parent: controllerAnimasi, curve: Curves.easeInCirc);
    controllerAnimasi.forward();
    controllerAnimasi.addListener(() {
      setState(() {});
      print(controllerAnimasi.value);
    });
    getPreference();
    controller = new TabController(vsync: this, length: 2);
    _checkConnectivity();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Icon hide = Icon(Icons.visibility_off);

  //show password
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  showHideRegister() {
    setState(() {
      _secureTextReg = !_secureTextReg;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    controllerAnimasi.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  //function login
  check() {
    final form = _key.currentState;
    setState(() {
      if (width == 200) {
        width = 100;
        crossWidget = true;
        if (form.validate()) {
          form.save();
          _checkConnectivityLogin();
        } else {
          width = 200;
          crossWidget = false;
        }
      }
    });
  }

  final _gLobalkey = new GlobalKey<ScaffoldState>();

  void _snackbar(String str, Color color) {
    _gLobalkey.currentState.showSnackBar(new SnackBar(
      backgroundColor: color,
      content: new Text(str,
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.white, fontSize: 15.0)),
      duration: new Duration(seconds: 2),
    ));
  }

  //check conectivity
  _checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _snackbar("No Connection Internet", Colors.red[500]);
    } else if (result == ConnectivityResult.mobile) {
      _snackbar("Internet Access", Colors.green[600]);
    } else if (result == ConnectivityResult.wifi) {
      _snackbar("Internet Access", Colors.green[600]);
    }
  }

  _checkConnectivityLogin() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _snackbar("No Connection Internet", Colors.red[500]);
      setState(() {
        crossWidget = false;
        width = 200;
      });
    } else if (result == ConnectivityResult.mobile) {
      // _snackbar("Internet Access", Colors.green[600]);
      login();
    } else if (result == ConnectivityResult.wifi) {
      // _snackbar("Internet Access", Colors.green[600]);
      login();
    }
  }

  _checkConnectivityRegisterStudent() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _snackbar("No Connection Internet", Colors.red[500]);
      setState(() {
        crossWidgetReg = false;
        widthReg = 200;
      });
    } else if (result == ConnectivityResult.mobile) {
      // _snackbar("Internet Access", Colors.green[600]);
      registerStudent();
    } else if (result == ConnectivityResult.wifi) {
      // _snackbar("Internet Access", Colors.green[600]);
      registerStudent();
    }
  }

  _checkConnectivityRegisterEmployee() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _snackbar("No Connection Internet", Colors.red[500]);
      setState(() {
        widthReg = 200;
        crossWidgetReg = false;
      });
    } else if (result == ConnectivityResult.mobile) {
      // _snackbar("Internet Access", Colors.green[600]);
      registerEmployee();
    } else if (result == ConnectivityResult.wifi) {
      // _snackbar("Internet Access", Colors.green[600]);
      registerEmployee();
    }
  }

  hideAlert() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  login() async {
    final response = await http.post(ApiService.login,
        body: {"username": username, "password": password});
    final result = jsonDecode(response.body);
    var namaApi = result['nama'];
    var userApi = result['username'];
    var passwordApi = result['password'];
    var imageUsers = result['image'];
    var success = result['success'];
    if (success == 1) {
      setState(() {
        _loginstate = LoginState.signIn;
        savePreference(success, namaApi, userApi, passwordApi, imageUsers);
      });
    } else {
      _snackbar("Invalid username or password", Colors.black);
      setState(() {
        crossWidget = false;
        width = 200;
        _loginstate = LoginState.notSignIn;
      });
    }
    print(imageUsers);
  }

  //function register
  checkRegister(int e) {
    final form = _keyRegister.currentState;
    setState(() {
      if (widthReg == 200) {
        widthReg = 100;
        crossWidgetReg = true;
        if (form.validate() && _currValue == 1) {
          form.save();
          _checkConnectivityRegisterStudent();
        } else if (form.validate() && _currValue == 2) {
          form.save();
          _checkConnectivityRegisterEmployee();
        } else {
          widthReg = 200;
          crossWidgetReg = false;
        }
      }
    });
  }

  registerStudent() async {
    final respon = await http.post(ApiService.registerStudent,
        body: {"username": userRegister, "password": passwordRegister});
    final result = jsonDecode(respon.body);
    var success = result['success'];
    var message = result['message'];
    if (success == 1) {
      setState(() {
        _snackbar(message, Colors.green[400]);
        widthReg = 200;
        crossWidgetReg = false;
      });
    } else if (success == 0) {
      setState(() {
        _snackbar(message, Colors.red[300]);
        widthReg = 200;
        crossWidgetReg = false;
      });
    } else if (success == 2) {
      setState(() {
        _snackbar(message, Colors.red[300]);
        widthReg = 200;
        crossWidgetReg = false;
      });
    } else if (success == 3) {
      setState(() {
        _snackbar(message, Colors.red[300]);
        widthReg = 200;
        crossWidgetReg = false;
      });
    }
  }

  registerEmployee() async {
    final respon = await http.post(ApiService.registerEmployee,
        body: {"username": userRegister, "password": passwordRegister});
    final result = jsonDecode(respon.body);
    var success = result['success'];
    var message = result['message'];
    if (success == 1) {
      setState(() {
        _snackbar(message, Colors.green[400]);
        widthReg = 200;
        crossWidgetReg = false;
      });
    } else if (success == 0) {
      setState(() {
        _snackbar(message, Colors.red[300]);
        widthReg = 200;
        crossWidgetReg = false;
      });
    } else if (success == 2) {
      setState(() {
        _snackbar(message, Colors.red[300]);
      });
      widthReg = 200;
      crossWidgetReg = false;
    } else if (success == 3) {
      setState(() {
        _snackbar(message, Colors.red[300]);
        widthReg = 200;
        crossWidgetReg = false;
      });
    }
  }

  savePreference(int success, String nama, String username, String password,
      String image) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("success", success);
      preferences.setString("nama", nama);
      preferences.setString("username", username);
      preferences.setString("password", password);
      preferences.setString("image", image);
      preferences.commit();
    });
  }

  var value;

  getPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("success");
      _loginstate = value == 1 ? LoginState.signIn : LoginState.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("success", null);
      preferences.commit();
      _loginstate = LoginState.notSignIn;
      crossWidget = false;
      width = 200;
    });
  }

  checkedRadio(int e) {
    setState(() {
      if (e == 1) {
        _currValue = 1;
      } else if (e == 2) {
        _currValue = 2;
      }
    });
  }

  Widget formLogin() {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                validator: (e) {
                  if (e.isEmpty) {
                    return "ID can't empty";
                  }
                },
                onSaved: (e) => username = e,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Nis/Nip", hintText: "Nis/Nip"),
              ),
            ),
            Expanded(
              child: TextFormField(
                onSaved: (e) => password = e,
                validator: (e) {
                  if (e.isEmpty) {
                    return "Password can't empty";
                  }
                },
                obscureText: _secureText,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  check();
                },
                child: Center(
                  child: AnimatedContainer(
                      curve: Curves.easeInOutCirc,
                      duration: Duration(seconds: 1),
                      height: 40,
                      width: width,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: crossWidget ? loading : signIn),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget formRegister() {
    return Form(
      key: _keyRegister,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: new Radio(
                    onChanged: (int e) => checkedRadio(e),
                    value: 1,
                    groupValue: _currValue,
                    // onChanged: _handleRadioValueChange1,
                  ),
                ),
                Expanded(
                  child: new Text(
                    'Siswa',
                    style: styleTextDefaultBlack,
                  ),
                ),
                Expanded(
                  child: new Radio(
                    value: 2,
                    groupValue: _currValue,
                    onChanged: (int e) => checkedRadio(e),
                    // onChanged: _handleRadioValueChange1,
                  ),
                ),
                Expanded(
                  child: new Text('Pegawai', style: styleTextDefaultBlack),
                ),
              ],
            ),
            Expanded(
              child: TextFormField(
                onSaved: (e) => userRegister = e,
                validator: (e) {
                  if (e.isEmpty) {
                    return "ID can't empty";
                  }
                },
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Nis/Nip", hintText: "Nis/Nip"),
              ),
            ),
            Expanded(
              child: TextFormField(
                onSaved: (e) => passwordRegister = e,
                validator: (e) {
                  if (e.isEmpty) {
                    return "Password can't empty";
                  }
                },
                obscureText: _secureTextReg,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: showHideRegister,
                      icon: Icon(_secureTextReg
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    hintText: "Password"),
              ),
            ),
            Expanded(
              child: Center(
                child: InkWell(
                    onTap: () {
                      checkRegister(0);
                    },
                    child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 40,
                        width: widthReg,
                        alignment: FractionalOffset.center,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: crossWidgetReg ? loading : titleReg)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginstate) {
      case LoginState.notSignIn:
        return Scaffold(
          key: _gLobalkey,
          body: Container(
            decoration: BoxDecoration(color: Colors.blue[500]),
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "image/tutwuri.png",
                      width: 200,
                      height: animasi.value * 180,
                      scale: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: ScaleAnimatedTextKit(
                  text: ["SELAMAT DATANG", "DI APLIKASI", "SISPENDIK"],
                  textStyle: styleTextBigWhite,
                  textAlign: TextAlign.center,
                  alignment: Alignment.center,
                )),
                SizedBox(
                  height: 30,
                ),
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: <Widget>[
                        TabBar(controller: controller, tabs: <Widget>[
                          Tab(child: Text("LOGIN", style: styleTextSmallBlack)),
                          Tab(
                              child:
                                  Text("REGISTER", style: styleTextSmallBlack))
                        ]),
                        SizedBox(
                          width: 300,
                          height: 250,
                          child: TabBarView(
                            controller: controller,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: formLogin(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: formRegister(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case LoginState.signIn:
        return Dashboard(signOut);
        break;
    }
  }
}

class Dashboard extends StatefulWidget {
  final VoidCallback signOut;

  Dashboard(this.signOut);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double width = 500;
  CircularProgressIndicator loading =
      CircularProgressIndicator(backgroundColor: Colors.white);
  Text titleButton = Text("KELUAR", style: TextStyle(color: Colors.blue[900]));
  bool crossWidget = false;

  String name = "", username = "", password = "", image = "";

  getPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("nama");
      username = preferences.getString("username");
      password = preferences.getString("password");
      image = preferences.getString("image");
    });
  }

  signOut() {
    setState(() {
      if (width == 500) {
        width = 200;
        crossWidget = true;
        widget.signOut();
      } else {
        width = 500;
        crossWidget = false;
      }
    });
  }

  var placeholder = Image.asset(
    "image/user.png",
    scale: 7,
  );

  int index = 0;

  Widget callpage(int _index) {
    switch (_index) {
      case 0:
        return HomeMenu(
          image: image,
          name: name,
        );
      case 1:
        return Absence();
      case 2:
        return Schedule();
      case 3:
        return Account(
          name: name,
          username: username,
          image: image,
          crossWidget: crossWidget,
          loading: loading,
          signOut: signOut,
          width: width,
          titleButton: titleButton,
        );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: callpage(index),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  "Menu",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.present_to_all,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  "Absensi",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                activeIcon: Icon(
                  Icons.present_to_all,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                title: Text(
                  "Jadwal",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                icon: Icon(Icons.schedule, color: Colors.blueGrey),
                activeIcon: Icon(
                  Icons.schedule,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                title: Text(
                  "Akun",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.blueGrey,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Absence extends StatefulWidget {
  @override
  _AbsenceState createState() => _AbsenceState();
}

class _AbsenceState extends State<Absence> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
