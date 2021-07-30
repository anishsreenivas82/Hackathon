



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutterlogindesign/pages/qr.dart';

import 'package:flutterlogindesign/pages/volunteer_page.dart';

String doc;
String uid;
String qr_code;
var tee;

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

  

 
  Future<DocumentSnapshot> getUserInfo() async
  {
    
    
return await FirebaseFirestore.instance.collection("Owners").doc(uid).collection('items').doc(doc).get();

  }
  

  @override
  Widget build(BuildContext context) {
    
    
    CollectionReference a = FirebaseFirestore.instance.collection('Shelter');
    CollectionReference b = FirebaseFirestore.instance.collection('Owners');

    doc = qr_code.substring(0, 20);
    uid = qr_code.substring(20);
    print(qr_code);
    print(doc);
    print(name);
    print(type);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return FutureBuilder(
            future: getUserInfo(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {

                
                return  Scaffold(
                  backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('VerifcationPage'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 22),
            ),
            Text('-',style: TextStyle(fontSize: 25),),
            Text(
              snapshot.data['Name'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
          SizedBox(height: height*0.05),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Type',
              style: TextStyle(fontSize: 22),
            ),
            Text('-',style: TextStyle(fontSize: 25),),
            Text(
              snapshot.data['Type'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
          SizedBox(height: height*0.05),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Quantity',
              style: TextStyle(fontSize: 22),
            ),Text('-',style: TextStyle(fontSize: 25),),
            Text(
              snapshot.data['Quantity'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
          SizedBox(height: height*0.05),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Baby Product',
              style: TextStyle(fontSize: 22),
            ),Text('-',style: TextStyle(fontSize: 25),),
            Text(
              snapshot.data['Baby'],
              style: TextStyle(fontSize: 22),
            ),
          ]),

          SizedBox(height: 20),
          Divider(height: 3,color: Colors.black,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Wrap(children: [Text('Are the products sealed?',style: TextStyle(fontSize: 18),)]),
                  width: width * 0.8),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Wrap(children: [
                    Text('Do the products have atleast 2 weeks before expiry?',style: TextStyle(fontSize: 18),)
                  ]),
                  width: width * 0.8),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Wrap(children: [
                    Text('Do the products match the description above?',style: TextStyle(fontSize: 18),)
                  ]),
                  width: width * 0.8),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  child: Text('Accept',style: TextStyle(fontSize: 25,color: Colors.green),)),
              TextButton(
                
                  onPressed: () {
                    b.doc(uid).collection('items').doc(doc).delete();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Volunteer()));
                  },
                  child: Text('Reject',style: TextStyle(fontSize: 25,color: Colors.red),))
            ],
          )


        ]),
      ),
    ) ;
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Text("No data");
              }
              return CircularProgressIndicator();
            },
          );

   

    

    
    

  }

  Future<void> qrscan() async {
    try {
      qr_code = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
          setState(() {
            return;
          });


    } on PlatformException {
      qr_code = 'Error';
    }
  }
}


    
    


