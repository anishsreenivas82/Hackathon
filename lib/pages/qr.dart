

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/item_page.dart';

class Qrcode extends StatefulWidget {
 

  @override
  _State createState() => _State();
}

class _State extends State<Qrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

      body: Center(
              child: BarcodeWidget(
          barcode: Barcode.qrCode(),
          color: Colors.white,
          data: generatedID ?? 'Hello World',
          width: 200,
          height: 200,
        ),
      )
      
    );
  }
}