import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/qrscan.dart';

class Volunteer extends StatefulWidget {
  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {

  int currentindex = 0;
  final List children = [Text('Stats'),Column(children:[FloatingActionButton(onPressed:(){return qrscan();})]),Text('r'),Text('r')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('My Flutter App'),
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
