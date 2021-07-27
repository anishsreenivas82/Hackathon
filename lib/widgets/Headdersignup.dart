import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderContainer1 extends StatelessWidget {
  var text = "";

  HeaderContainer1(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(15),
            ),
          ),
          Center(
            child: Lottie.asset('assets/lottie/lottie.json'),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(15),
            ),
          ),
          Center(
            child: Text(
              "Welcome!",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              "Please fill in the following details and",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              "help us start serving you.",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(25),
            ),
          ),
          Center(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 15, color: Colors.white54),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.white54,
                    thickness: 1,
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(5),
            ),
          ),
        ],
      ),
    );
  }
}
