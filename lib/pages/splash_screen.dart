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

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.amber[100],
          appBar: AppBar(
              automaticallyImplyLeading:
                  false, //To remov;e back arrow for navigator push
              title: Text("Here4Hygiene",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              centerTitle: true,
              backgroundColor: Colors.blue),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      'Choose your role: ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(width * 0.02,
                                height * 0.05, width * 0.02, height * 0.05),
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
                                                  builder: (context) =>
                                                      LoginPage()));
                                        },
                                        child: ConstrainedBox(
                                          constraints:
                                              new BoxConstraints.expand(),
                                          child: new Image.asset(
                                              'assets/do.png',
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
                            padding: EdgeInsets.fromLTRB(width * 0.02,
                                height * 0.05, width * 0.02, height * 0.05),
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
                                                  builder: (context) =>
                                                      LoginPage()));
                                        },
                                        child: ConstrainedBox(
                                          constraints:
                                              new BoxConstraints.expand(),
                                          child: new Image.asset(
                                              'assets/h1.png',
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
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            25, height * 0.05, 20, height * 0.05),
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
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: ConstrainedBox(
                                      constraints: new BoxConstraints.expand(),
                                      child: new Image.asset('assets/3.png',
                                          fit: BoxFit.cover,
                                          gaplessPlayback: true),
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
            ),
          )),
    );
  }
}
