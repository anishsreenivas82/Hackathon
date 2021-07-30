import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutterlogindesign/pages/splash_screen.dart';
import 'package:flutterlogindesign/pages/verification.dart';
import 'package:lottie/lottie.dart';

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
                  child:Container(
                  height: height * 0.40,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.03, height * 0.01, width * 0.03, height * 0.01),
                  child: Container(
                    child: new Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width*0.1),
                      ),
                      child: InkWell(
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.04),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Name:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Name'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Address:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Address'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Phone Number:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Phno'].toString()),
                                  
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ElevatedButton(onPressed:(){
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
                              .delete());
                                  }, child:Text('Accept',style: TextStyle(fontSize: 15)))
                            ])))))));
            }).toList(),
          );
        },
      ),
      Center(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [Lottie.asset('assets/lottie/lottie.json'),
          ElevatedButton(child:Text('QR Scanner',style: TextStyle(color:Colors.white,fontSize: 20)),onPressed: () {
            
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VerifcationPage()));
          },
          style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber[800]) ))
        ]),
      ),
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
                  child:Container(
                  height: height * 0.40,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.03, height * 0.01, width * 0.03, height * 0.01),
                  child: Container(
                    child: new Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width*0.1),
                      ),
                      child: InkWell(
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.04),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Name:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Name'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Address:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Address'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Phone Number:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Phno'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ])))))));
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
              
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Image.asset('assets/capture.png',) ,Text('Here 4 Hygiene',style: TextStyle(fontSize: 15, color: Colors.black),)]),
              decoration: BoxDecoration(color: Colors.blue),
              
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person)
            ),
            ListTile(
              title: Text('Location'),
              leading: Icon(Icons.map_outlined),
            ),
            ListTile(
              title: Text('Terms and Conditions'),
              leading: Icon(Icons.checklist)
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
