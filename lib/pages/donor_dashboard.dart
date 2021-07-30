import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/signin_page.dart';
import 'package:flutterlogindesign/pages/item_page.dart';
import 'package:flutterlogindesign/pages/signup_page.dart';
import 'package:flutterlogindesign/pages/pending_orders.dart';
import 'package:flutterlogindesign/pages/splash_screen.dart';
import 'package:flutterlogindesign/pages/verification.dart';
import 'package:flutterlogindesign/pages/verifieditems.dart';

FirebaseAuth auth = FirebaseAuth.instance;
var uidDonor = auth.currentUser.uid;

class Donor extends StatefulWidget {
  @override
  _DonorState createState() => _DonorState();
}

class _DonorState extends State<Donor> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(uidDonor);
    return Scaffold(
      backgroundColor: Colors.amber[100],
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
                
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                })
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width*0.1)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.add_box,
                            color: Colors.blue,
                          ),
                          title: Text('New Donation'),
                          subtitle: Text('Donate hygine and sanitary products'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('Proceed'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Itempage()));
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width*0.1)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.verified,
                            color: Colors.green,
                          ),
                          title: Text('Previous donations'),
                          subtitle: Text('View your previous donations'),
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
                                        builder: (context) => Verified()));
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width*0.1)
                    ),  
                    child: Column(
                    
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height:8),
                        const ListTile(
                          leading: Icon(
                            Icons.history,
                            color: Colors.yellow,
                          ),
                          title: Text('Donations in progress'),
                          subtitle: Text(
                              'View all donations which are yet to be verified'),
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
                                        builder: (context) => PendingOrders()));
                                
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
