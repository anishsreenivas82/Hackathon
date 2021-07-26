import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/signin_page.dart';
import 'package:flutterlogindesign/pages/splash_screen.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

  
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
              child: Column(
          children: [
            Lottie.asset(
              'assets/lottie/lottie.json',
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration 
                  ..forward().whenComplete(() => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      ));
              },
            ),
          ],
        ),
      ),
    );
  }
}