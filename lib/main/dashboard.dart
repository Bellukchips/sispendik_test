// import 'package:flutter/material.dart';
// import 'package:sispendik/payment/payment.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Dashboard extends StatefulWidget {
//   final VoidCallback signOut;

//   const Dashboard({Key key, this.signOut}) : super(key: key);
//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   String name="";
//   getPreference()async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       name = preferences.getString("nama");

//     });
//   }
//   signOut(){
//     setState(() {
//       widget.signOut();
//     });
//   }
//   int index = 0;
//   Widget callpage(int _index) {
//     switch (_index) {
//       case 0:
//         return HomePage();
//       case 1:
//         return Absence();
//       case 2:
//         return Schedule();
//       case 3:
//         return Account();
//       default:
//         return HomePage();
//     }
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getPreference();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: callpage(index),
//         bottomNavigationBar: BottomNavigationBar(
//           elevation: 10,
//           currentIndex: index,
//           onTap: (value) {
//             index = value;
//             setState(() {});
//           },
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home,
//                   color: Colors.blueGrey,
//                 ),
//                 title: Text(
//                   "Menu",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//                 activeIcon: Icon(
//                   Icons.home,
//                   color: Colors.blue,
//                 )),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.present_to_all,
//                   color: Colors.blueGrey,
//                 ),
//                 title: Text(
//                   "Absensi",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//                 activeIcon: Icon(
//                   Icons.present_to_all,
//                   color: Colors.blue,
//                 )),
//             BottomNavigationBarItem(
//                 title: Text(
//                   "Jadwal",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//                 icon: Icon(Icons.schedule, color: Colors.blueGrey),
//                 activeIcon: Icon(
//                   Icons.schedule,
//                   color: Colors.blue,
//                 )),
//             BottomNavigationBarItem(
//                 title: Text(
//                   "Akun",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//                 icon: Icon(
//                   Icons.account_circle,
//                   color: Colors.blueGrey,
//                 ),
//                 activeIcon: Icon(
//                   Icons.account_circle,
//                   color: Colors.blue,
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         Stack(
//           children: <Widget>[
//             Container(
//               height: 250,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.bottomLeft,
//                       end: Alignment.topRight,
//                       colors: [Colors.blue[300], Colors.blue[400]])),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 80, left: 30),
//               child: Row(
//                 children: <Widget>[
//                   Image.asset(
//                     "image/user.png",
//                     scale: 6,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, bottom: 5),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Hai..! Selamat Datang",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20),
//                           child: Text(
//                             "Muh Lukman Akbar P",
//                             style: TextStyle(color: Colors.white, fontSize: 17),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
//               child: Card(
//                 elevation: 10,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Container(
//                   height: 100,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.payment),
//                               iconSize: 50,
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (c) => Payment()));
//                               },
//                             ),
//                             Text("Bayar")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.attach_money),
//                               iconSize: 50,
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (c) => Payment()));
//                               },
//                             ),
//                             Text("Tunggakan")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.history),
//                               iconSize: 50,
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (c) => Payment()));
//                               },
//                             ),
//                             Text("Riwayat")
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
//           child: Card(
//             elevation: 20,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             child: Container(
//               height: 330,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 50,
//                             ),
//                             Text("Dompet")
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class Schedule extends StatefulWidget {
//   @override
//   _ScheduleState createState() => _ScheduleState();
// }

// class _ScheduleState extends State<Schedule> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class Absence extends StatefulWidget {
//   @override
//   _AbsenceState createState() => _AbsenceState();
// }

// class _AbsenceState extends State<Absence> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class Account extends StatefulWidget {
//   @override
//   _AccountState createState() => _AccountState();
// }

// class _AccountState extends State<Account> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
