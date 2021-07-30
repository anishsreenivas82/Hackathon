import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/shelter_prev_donations.dart';
import 'package:flutterlogindesign/pages/shelter_verified_donations.dart';
import 'package:flutterlogindesign/pages/splash_screen.dart';

class Shelter_page extends StatefulWidget {
  // const Shelter_page({ Key? key }) : super(key: key);

  @override
  _Shelter_pageState createState() => _Shelter_pageState();
}

class _Shelter_pageState extends State<Shelter_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
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
              leading: Icon(Icons.person),
              
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
              onTap: (){ FirebaseAuth.instance.signOut();
              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()));},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.23,
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.add_box,
                            color: Colors.blue,
                          ),
                          title: Text('Available Donations'),
                          subtitle: Text('View donations that are verified'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('View'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Shelter_verified_don()));
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
                height: MediaQuery.of(context).size.height * 0.23,
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.verified,
                            color: Colors.green,
                          ),
                          title: Text('Previously recived donations'),
                          subtitle: Text('View donations which you had requested for before'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('View'),
                              onPressed: () {
                                Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Shelter_Prev()));
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            
          ],
        ),
      ),
    );
  }
}
