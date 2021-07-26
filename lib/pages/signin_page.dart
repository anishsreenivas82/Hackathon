import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/signup_page.dart';
import 'package:flutterlogindesign/widgets/Headdersignin.dart';
import 'package:flutterlogindesign/widgets/btn_widget.dart';
import 'package:flutterlogindesign/widgets/Headdersignup.dart';

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

    return Scaffold(
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
                    _textInput(hint: "Email", icon: Icons.person),
                    _textInput(hint: "Password", icon: Icons.lock),
                    SizedBox(height: 20),
                    Center(
                      child: ButtonWidget(
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegPage()));
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

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          // border: InputBorder.none,
          border: new UnderlineInputBorder(
            borderSide: new BorderSide(),
          ),
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
