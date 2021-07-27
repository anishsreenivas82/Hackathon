import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderContainer2 extends StatelessWidget {
  var text = "";

  HeaderContainer2(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.lightBlueAccent,
      child: Wrap(children: [
        Column(
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
            Center(
              child: Container(
                padding: const EdgeInsets.all(5),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
