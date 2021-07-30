import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutterlogindesign/pages/qr.dart';
import 'package:flutterlogindesign/pages/qrscan.dart';
import 'package:flutterlogindesign/pages/volunteer_page.dart';

String doc;
String uid;
String qr_code;
var name, type, quantity, babyproduct;

class VerifcationPage extends StatefulWidget {
  // const VerifcationPage({ Key? key }) : super(key: key);

  @override
  _VerifcationPageState createState() => _VerifcationPageState();
}

class _VerifcationPageState extends State<VerifcationPage> {
  int radio1;
  int radio2;
  int radio3;
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radio1 = 0;
    radio2 = 0;
    radio3 = 0;
    i = 0;
    name = "";
    type = "";
    quantity = "";
    babyproduct = "";
    qrscan();
  }

  // setRadio(value) {
  //   setState(() {
  //     radio = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    CollectionReference a = FirebaseFirestore.instance.collection('Shelter');
    CollectionReference b = FirebaseFirestore.instance.collection('Owners');

    doc = qr_code.substring(0, 20);
    uid = qr_code.substring(20);

    // for(int i=0;i<20;i++)
    // {
    //   doc = ''+qrcode[i];
    // }
    // for(int i=20;i<48;i++)
    // {
    //   uid = ''+qrcode[i];
    // }

    var info = FirebaseFirestore.instance
        .collection('Owners')
        .doc(uid)
        .collection('items')
        .doc(doc);
    info.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot.get('Name').toString();
        type = documentSnapshot.get('Type').toString();
        quantity = documentSnapshot.get('Quantity').toString();
        babyproduct = documentSnapshot.get('Baby').toString();
      } else
        CircularProgressIndicator();
      print("here");
    });

    print(qr_code);
    TextButton button;
    // if(i<3) button = TextButton(onPressed: (){}, child: Text('Reject'));
    // if(i>=3) button = TextButton(onPressed: (){}, child: Text('Accept'));

    TextButton(onPressed: () {}, child: Text('Accept'));
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('VerifcationPage'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 15),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Type',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              type,
              style: TextStyle(fontSize: 15),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Quantity',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              quantity,
              style: TextStyle(fontSize: 15),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Baby Product',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              babyproduct,
              style: TextStyle(fontSize: 15),
            ),
          ]),

          SizedBox(height: 20),

          Row(
            children: [
              Container(
                  child: Wrap(children: [Text('Are the products sealed?')]),
                  width: width * 0.6),
              Radio(
                  value: 1,
                  groupValue: radio1,
                  onChanged: (value) {
                    setState(() {
                      radio1 = value;

                      i++;
                    });
                  })
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Container(
                  child: Wrap(children: [
                    Text('Do the products have atleast 2 weeks before expiry')
                  ]),
                  width: width * 0.6),
              Radio(
                  value: 2,
                  groupValue: radio2,
                  onChanged: (value) {
                    setState(() {
                      radio2 = value;
                      i++;
                    });
                  })
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Container(
                  child: Wrap(children: [
                    Text('Do the products match the description above')
                  ]),
                  width: width * 0.6),
              Radio(
                  value: 3,
                  groupValue: radio3,
                  onChanged: (value) {
                    setState(() {
                      radio3 = value;
                      i++;
                    });
                  })
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              TextButton(
                  onPressed: () {
                    a.doc('donations').collection('donations').doc(doc).set({
                      'Name': name,
                      'Type': type,
                      'Quantity': quantity,
                      'Baby': babyproduct,
                      'Status': 'Verified',
                    });
                    
                    b.doc(uid).collection('verified items').doc(doc).set({
                      'Name': name,
                      'Type': type,
                      'Quantity': quantity,
                      'Baby': babyproduct,
                      'Status': 'Verified',
                    });

                    b.doc(uid).collection('items').doc(doc).delete();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Volunteer()));
                  },
                  child: Text('Accept')),
              TextButton(
                  onPressed: () {
                    b.doc(uid).collection('items').doc(doc).delete();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Volunteer()));
                  },
                  child: Text('Reject'))
            ],
          )

          //   Text('Do the products have more than 2 weeks of time before expiry?'),
          //   Text('Does the product match the description?')

          // ]),
          //           ),
          // Column(children: [
          //   Radio(
          //   value: 1,
          //   groupValue: 0,
          //   onChanged: (value) {
          //     setRadio();
          //     i++;
          //   }),
          //   Radio(
          //   value: 1,
          //   groupValue: 0,
          //   onChanged: (value) {
          //     setRadio();
          //     i++;
          //   }),
          //   Radio(
          //   value: 1,
          //   groupValue: 0,
          //   onChanged: (value) {
          //     setRadio();
          //     i++;
          //   })
          // ],)
          //           ]),
        ]),
      ),
    );
  }

  Future<void> qrscan() async {
    try {
      qr_code = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      qr_code = 'Error';
    }
  }
}
