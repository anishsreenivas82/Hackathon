import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/donor_dashboard.dart';
import 'package:flutterlogindesign/pages/qr.dart';
import 'package:fluttertoast/fluttertoast.dart';

String generatedID;

class Itempage extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Itempage> {
  final name = TextEditingController();
  final quantity = TextEditingController();
  final type = TextEditingController();
  final baby = TextEditingController();

  CollectionReference x = FirebaseFirestore.instance.collection('Owners');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Itempage'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.01, height * 0.01, width * 0.01, height * 0.01),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Product Name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.01, height * 0.01, width * 0.01, height * 0.01),
              child: TextField(
                controller: quantity,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Quantity'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.01, height * 0.01, width * 0.01, height * 0.01),
              child: TextField(
                controller: baby,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Is it a baby Porduct(yes or no)'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.01, height * 0.01, width * 0.01, height * 0.01),
              child: TextField(
                controller: type,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type'),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                x.doc(uidDonor).collection('items').add({
                  'Name': name.text,
                  'Type': type.text,
                  'Quantity': quantity.text,
                  'Baby': baby.text
                }).then((querySnapshot) {
                  // Here we call the document just after creation

                   generatedID = querySnapshot.id.toString() +
                      uidDonor.toString(); // Here we call the ID of the document
                    Fluttertoast.showToast(
                                  msg: "Item added.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                  );

                      
                });

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Qrcode()));
              },
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}

// class AddUser extends StatelessWidget {
//   final String name;
//   final String quantity;
//   final String type;

//   AddUser(this.name, this.quantity, this.type);

//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'full_name': name, // John Doe
//             'company': quantity, // Stokes and Sons
//             'age': Typography.englishLike2014 // 42
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

//     return FlatButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }
