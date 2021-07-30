import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/shelter_page.dart';
import 'package:flutterlogindesign/pages/signup_page.dart';
import 'package:flutterlogindesign/pages/volunteer_page.dart';
import 'package:flutterlogindesign/widgets/Headdersignin.dart';
import 'package:flutterlogindesign/widgets/btn_widget.dart';
import 'package:flutterlogindesign/widgets/Headdersignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'donor_dashboard.dart';

//to push
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => RegPage(),
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);

      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      const curve = Curves.easeOut;
      final offsetAnimation = animation.drive(tween);

      final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

var choice;
var check;
TapGestureRecognizer _signupConditionRecognizer;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    _signupConditionRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).push(_createRoute());
      };
    TextEditingController emailcontroller = new TextEditingController();
    TextEditingController passwordcontroller = new TextEditingController();
    // FutureBuilder(
    //   future: getUserInfo(),
    //   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return snapshot.data.data["Position"];
    //     } else if (snapshot.connectionState == ConnectionState.none) {
    //       return Text("No data");
    //     }
    //     return CircularProgressIndicator();
    //   },
    // );
//     final String _collection = 'collectionName';
// final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

// getData() async {
//   return await _fireStore.collection(_collection).doc('CollectionNumber');
// }

// getData().then((val){
//   print(val.get().;
// });
    FirebaseFirestore.instance
        .collection('Tracker')
        .doc('CollectionNumber')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document data: ${documentSnapshot.data()}');
        choice = documentSnapshot.data().values.toString();
      } else {
        print('Document does not exist on the database');
      }
    });
    // print(choice);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              HeaderContainer2('Login'),
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
                    SizedBox(height: 20),
                    Center(
                      child: ButtonWidget(
                        onClick: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text);
                            var uid = FirebaseAuth.instance.currentUser.uid;

                            if (choice == "(1)") {
                              FirebaseFirestore.instance
                                  .collection('Owners')
                                  .doc(uid)
                                  .get()
                                  .then((DocumentSnapshot documentSnapshot) {
                                if (documentSnapshot.exists) {
                                  check = documentSnapshot.get("choice");
                                } else {
                                  check = '(0)';
                                }
                              });
                              if (check == "(3)" ||
                                  check == "(2)" ||
                                  check == "(0)") {
                                FirebaseAuth.instance.signOut();
                                Fluttertoast.showToast(
                                  msg: "No account found",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );
                                print("No account found");
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Donor()));
                              }
                            } else if (choice == "(2)") {
                              FirebaseFirestore.instance
                                  .collection('Shelter')
                                  .doc(uid)
                                  .get()
                                  .then((DocumentSnapshot documentSnapshot) {
                                if (documentSnapshot.exists) {
                                  check = documentSnapshot.get("choice");
                                } else {
                                  check = '(0)';
                                }
                              });
                              if (check == "(3)" ||
                                  check == "(1)" ||
                                  check == "(0)") {
                                FirebaseAuth.instance.signOut();
                                Fluttertoast.showToast(
                                  msg: "No account found",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );
                                print("No account found");
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Shelter_page()));
                              }
                            } else if (choice == "(3)") {
                              FirebaseFirestore.instance
                                  .collection('Volunteer')
                                  .doc(uid)
                                  .get()
                                  .then((DocumentSnapshot documentSnapshot) {
                                if (documentSnapshot.exists) {
                                  check = documentSnapshot.get("choice");
                                } else {
                                  check = '(0)';
                                }
                              });
                              if (check == "(2)" ||
                                  check == "(1)" ||
                                  check == "(0)") {
                                FirebaseAuth.instance.signOut();
                                Fluttertoast.showToast(
                                  msg: "No account found",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );
                                print("No account found");
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Volunteer()));
                              }
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Fluttertoast.showToast(
                                  msg: "No user found for that email.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                               Fluttertoast.showToast(
                                  msg: "Wrong password provided for that user.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                        btnText: "SIGN IN",
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      alignment: Alignment.center,
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(color: Colors.black38)),
                        TextSpan(
                            text: "Sign Up",
                            recognizer: _signupConditionRecognizer,
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
