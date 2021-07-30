import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutterlogindesign/pages/splash_screen.dart';
import 'package:flutterlogindesign/pages/verification.dart';

FirebaseAuth auth = FirebaseAuth.instance;
var uidVolunteer = auth.currentUser.uid;

class Volunteer extends StatefulWidget {
  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  Future<void> x;
  // PageController _pageController;

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  int currentindex = 0;
  final Stream<QuerySnapshot> _PendingVerifyStream = FirebaseFirestore.instance
      .collection('Volunteer')
      .doc('pending verifications')
      .collection('pending verifications')
      .snapshots();
  final Stream<QuerySnapshot> _AcceptedVerifyStream = FirebaseFirestore.instance
      .collection('Volunteer')
      .doc(uidVolunteer)
      .collection('accepted verifications')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final List children = [
      StreamBuilder<QuerySnapshot>(
        stream: _PendingVerifyStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Container(
                height: height * 0.25,
                padding: EdgeInsets.fromLTRB(
                    width * 0.01, height * 0.01, width * 0.01, height * 0.01),
                child: new Card(
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Item Name-' + data['Name'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Address-' + data['Address'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Phone Number-' + data['Phno'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //   Text('Quantity-'+ data['Quantity'].toString(),
                        //   style: TextStyle(fontSize: 15),),
                        //   Text('Baby Product-'+ data['Baby'].toString(),
                        //   style: TextStyle(fontSize: 15),)
                        // ])
                      ],
                    ),
                    onTap: () => {
                      FirebaseFirestore.instance
                          .collection('Volunteer')
                          .doc(uidVolunteer)
                          .collection('accepted verifications')
                          .add({
                        'Name': data['Name'].toString(),
                        'Address': data['Address'].toString(),
                        'Phno': data['Phno'].toString(),
                      }).then((value) => FirebaseFirestore.instance
                              .collection('Volunteer')
                              .doc('pending verifications')
                              .collection('pending verifications')
                              .doc(document.id)
                              .delete()),
                      // generatedID = document.id.toString() + uidDonor.toString(),
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Qrcode()))
                    },
                  ),
                  // title: new Text(data['Name'].toString()),
                  // subtitle: new Text(data['Type'].toString()),
                ),
              );
            }).toList(),
          );
        },
      ),
      Column(children: [
        FloatingActionButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => VerifcationPage()));
        })
      ]),
      StreamBuilder<QuerySnapshot>(
        stream: _AcceptedVerifyStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Container(
                height: height * 0.25,
                padding: EdgeInsets.fromLTRB(
                    width * 0.01, height * 0.01, width * 0.01, height * 0.01),
                child: new Card(
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Item Name-' + data['Name'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Address-' + data['Address'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Phone Number-' + data['Phno'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //   Text('Quantity-'+ data['Quantity'].toString(),
                        //   style: TextStyle(fontSize: 15),),
                        //   Text('Baby Product-'+ data['Baby'].toString(),
                        //   style: TextStyle(fontSize: 15),)
                        // ])
                      ],
                    ),
                    // onTap: () => {
                    //   // generatedID = document.id.toString() + uidDonor.toString(),
                    //   // Navigator.push(context,
                    //   //     MaterialPageRoute(builder: (context) => Qrcode()))
                    // },
                  ),
                  // title: new Text(data['Name'].toString()),
                  // subtitle: new Text(data['Type'].toString()),
                ),
              );
            }).toList(),
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Here 4 Hygiene'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Location'),
              leading: Icon(Icons.map_outlined),
            ),
            ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                })
          ],
        ),
      ),
      body: children[currentindex], // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber[200],
        unselectedItemColor: Colors.amber[100],
        // new
        currentIndex: currentindex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.pending),
            label: ('Pending'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: ('QR Scan'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: ('Accepted'),
          ),
          //  new BottomNavigationBarItem(
          //    icon: Icon(Icons.person),
          //    label: ('Previous Ver')
          //  ),
          //   new BottomNavigationBarItem(
          //    icon: Icon(Icons.person),
          //    label: ('Pending ver')
          //  )
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;

            //  _pageController.animateToPage(index,
            //     duration: Duration(milliseconds: 500), curve: Curves.easeOut);
          });
        },
      ),
    );
  }

//   void _onItemTapped(int index) {
//     setState(() {
// currentindex = index;
//           //
//           //
//           //using this page controller you can make beautiful animation effects
//           _pageController.animateToPage(index,
//               duration: Duration(milliseconds: 500), curve: Curves.easeOut);
// });
//   }
}

// var qrcode = '';
// Future<void> qrscan() async{
//   try {
//    qrcode = await FlutterBarcodeScanner.scanBarcode(
//     '#ff6666',
//     'Cancel',
//     true,
//     ScanMode.QR);
//     return 'xyz';

//   }
//   on PlatformException{
//     qrcode='Error';
//   }

// }
