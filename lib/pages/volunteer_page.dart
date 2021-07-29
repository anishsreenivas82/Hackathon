import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutterlogindesign/pages/qrscan.dart';
import 'package:flutterlogindesign/pages/splash_screen.dart';
import 'package:flutterlogindesign/pages/verification.dart';

class Volunteer extends StatefulWidget {
  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  Future<void> x;
  
  

  int currentindex = 0;
  
  @override
  Widget build(BuildContext context) {
    final List children = [Text('Stats'),Column(children:[FloatingActionButton(onPressed:(){ Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VerifcationPage()));})]),Text('r'),Text('r')];
    
    return Scaffold(
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
              onTap: (){ FirebaseAuth.instance.signOut();
              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()));}
            )
          ],
        ),
      ),
     body: children[currentindex], // new
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       backgroundColor: Colors.blue,
        // new
       currentIndex: currentindex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           label: ('Stats'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.mail),
           label: ('QR Scan'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: ('Previous Ver')
         ),
          new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: ('Pending ver')
         )
       ],
       onTap: (index){
         setState(() {
           currentindex = index;
         });
       },
     ),
    );
  }
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