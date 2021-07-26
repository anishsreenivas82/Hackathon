import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/signin_page.dart';
import 'package:flutterlogindesign/widgets/btn_widget.dart';
import 'package:flutterlogindesign/widgets/Headdersignup.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    _textInput(hint: "Email", icon: Icons.person),
                    _textInput(hint: "Password", icon: Icons.lock),
                    _textInput(
                        hint: "Phone Number",
                        icon: Icons.phone_android_outlined),
                        SizedBox(
                          height:15
                        ),
                    Center(
                      child: ButtonWidget(
                        btnText: "SIGN UP",
                        onClick: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                     SizedBox(
                          height:15
                        ),
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

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
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
