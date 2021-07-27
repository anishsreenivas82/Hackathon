import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/qrscan.dart';

class VerifcationPage extends StatefulWidget {
  // const VerifcationPage({ Key? key }) : super(key: key);

  @override
  _VerifcationPageState createState() => _VerifcationPageState();
}

class _VerifcationPageState extends State<VerifcationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('VerifcationPage'),
        centerTitle: true,
        ),

      
    );
  }
}