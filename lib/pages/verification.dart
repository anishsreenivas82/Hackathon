import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutterlogindesign/pages/qr.dart';
import 'package:flutterlogindesign/pages/qrscan.dart';

String qr_code = '';

class VerifcationPage extends StatefulWidget {
  // const VerifcationPage({ Key? key }) : super(key: key);

  

  @override
  _VerifcationPageState createState() => _VerifcationPageState();
}

class _VerifcationPageState extends State<VerifcationPage> {
  

  @override
  Widget build(BuildContext context) {
    
    
    qrscan();
    String doc;
    String uid;

    doc = qr_code.substring(0,20);
    uid = qr_code.substring(20,48);

    
    // for(int i=0;i<20;i++)
    // {
    //   doc = ''+qrcode[i];
    // }
    // for(int i=20;i<48;i++)
    // {
    //   uid = ''+qrcode[i];
    // }

    final info = FirebaseFirestore.instance.collection('Owners').doc(uid).collection('items').doc(doc);
    print(qr_code);

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('VerifcationPage'),
        centerTitle: true,
        ),
        
        // body: Column(
        //   children: [Text(info.data['Name'])],)
        body:Text('$qr_code aaaaaaaaaaaaa'),

      
    );
  }
}
Future<void> qrscan() async{
  try {
   qr_code = await FlutterBarcodeScanner.scanBarcode(
    '#ff6666', 
    'Cancel', 
    true,
    ScanMode.QR);
    
    


    
    
  }
  on PlatformException{
    qr_code='Error';
  }

    
}