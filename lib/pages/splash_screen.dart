import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/signin_page.dart';
import 'package:flutterlogindesign/pages/signup_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference track =
        FirebaseFirestore.instance.collection('Tracker');
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading:
                false, //To remove back arrow for navigator push
            title: Text(
              "Insert Generic App Name",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue),
        body: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: SingleChildScrollView(
                      child: Column(
              children: [
                SizedBox(
                  height: 100.00,
                ),
                Text('Choose your role: '),
                SizedBox(
                  height: 100.00,
                ),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 45, 20, 45),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: FittedBox(
                                child: FloatingActionButton(
                                    onPressed: () {
                                      track
                                          .doc("CollectionNumber")
                                          .update({"Position": 1});
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage()));
                                    },
                                    child: ConstrainedBox(
                                      constraints: new BoxConstraints.expand(),
                                      child: new Image.asset('assets/do.png',
                                          fit: BoxFit.cover,
                                          gaplessPlayback: true),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20.00,
                            ),
                            Text('Sign in as a Donor')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 45, 20, 45),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: FittedBox(
                                child: FloatingActionButton(
                                    onPressed: () {
                                      track
                                          .doc("CollectionNumber")
                                          .update({"Position": 2});
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage()));
                                    },
                                    child: ConstrainedBox(
                                      constraints: new BoxConstraints.expand(),
                                      child: new Image.asset('assets/h1.png',
                                          fit: BoxFit.cover,
                                          gaplessPlayback: true),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20.00,
                            ),
                            Text('Sign in as a Reciver')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.00,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 20, 45),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          child: FittedBox(
                            child: FloatingActionButton(
                                onPressed: () {
                                  track
                                      .doc("CollectionNumber")
                                      .update({"Position": 3});
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: ConstrainedBox(
                                  constraints: new BoxConstraints.expand(),
                                  child: new Image.asset('assets/3.png',
                                      fit: BoxFit.cover, gaplessPlayback: true),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20.00,
                        ),
                        Text('Sign in as a Volunteer')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
