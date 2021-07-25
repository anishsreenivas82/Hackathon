import 'package:flutter/material.dart';

class HeaderContainer2 extends StatelessWidget {
  var text = "";

  HeaderContainer2(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.lightBlueAccent,
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(15),
            ),
          ),
          Center(
            child: Image.asset("assets/logo.png"),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(35),
            ),
          ),
          Center(
            child: Text(
              "Welcome Back",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              "Please login to continue",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              "from where you left",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(55),
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
                      style: TextStyle(fontSize: 15, color: Colors.white),
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
                      style: TextStyle(fontSize: 15, color: Colors.white54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
