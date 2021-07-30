import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/shelter_page.dart';
import 'package:flutterlogindesign/pages/signin_page.dart';
import 'package:flutterlogindesign/pages/volunteer_page.dart';
import 'package:flutterlogindesign/widgets/btn_widget.dart';
import 'package:flutterlogindesign/widgets/Headdersignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'donor_dashboard.dart';

TapGestureRecognizer _signinConditionRecognizer;

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    _signinConditionRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    TextEditingController emailcontroller = new TextEditingController();
    TextEditingController passwordcontroller = new TextEditingController();
    TextEditingController phonecontroller = new TextEditingController();
    String id;
    FirebaseFirestore.instance
        .collection('Tracker')
        .doc('CollectionNumber')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        choice = documentSnapshot.data().values.toString();
      } else {
        print('Document does not exist on the database');
      }
    });
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "SignUp",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              HeaderContainer1("Sign Up"),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        hint: "Email",
                        icon: Icons.person,
                        myController: emailcontroller,
                        obscure: false),
                    _textInput(
                        hint: "Password",
                        icon: Icons.lock,
                        myController: passwordcontroller,
                        obscure: true),
                    _textInput(
                        hint: "Phone Number",
                        icon: Icons.phone_android_outlined,
                        myController: phonecontroller,
                        obscure: false),
                    SizedBox(height: 15),
                    Center(
                      child: ButtonWidget(
                        btnText: "SIGN UP",
                        onClick: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text);
                            var uid = FirebaseAuth.instance.currentUser.uid;
                            if (choice == "(1)") {
                              FirebaseFirestore.instance
                                  .collection('Owners')
                                  .doc(uid)
                                  .set({
                                'Email': emailcontroller.text,
                                'Password': passwordcontroller.text,
                                'choice': choice,
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Donor()));
                            } else if (choice == "(2)") {
                              FirebaseFirestore.instance
                                  .collection('Shelter')
                                  .doc(uid)
                                  .set({
                                'Email': emailcontroller.text,
                                'Password': passwordcontroller.text,
                                'choice': choice,
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Shelter_page()));
                            } else if (choice == "(3)") {
                              FirebaseFirestore.instance
                                  .collection('Volunteer')
                                  .doc(uid)
                                  .set({
                                'Email': emailcontroller.text,
                                'Password': passwordcontroller.text,
                                'choice': choice,
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Volunteer()));
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              Fluttertoast.showToast(
                                  msg: "The password provided is too weak.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') { 
                              Fluttertoast.showToast(
                                  msg: "The account already exists for that email.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );

                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            Fluttertoast.showToast(
                                  msg: "$e",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );

                            print(e);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black45)),
                        TextSpan(
                            text: "Sign In",
                            recognizer: _signinConditionRecognizer,
                            style: TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.underline,
                            )),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInput({hint, icon, myController, obscure}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
          border: new UnderlineInputBorder(
            borderSide: new BorderSide(),
          ),
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
        obscureText: obscure,
      ),
    );
  }
}
