import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/signup_page.dart';
import 'package:flutterlogindesign/widgets/Headdersignin.dart';
import 'package:flutterlogindesign/widgets/btn_widget.dart';
import 'package:flutterlogindesign/widgets/Headdersignup.dart';

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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegPage()));
      };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer2("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Email", icon: Icons.person),
                    _textInput(hint: "Password", icon: Icons.lock),
                    Expanded(
                      child: Center(
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
                    ),
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
              ),
            )
          ],
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
