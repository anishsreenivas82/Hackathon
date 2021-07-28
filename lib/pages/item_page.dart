import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/qr.dart';

String generatedID;

class Itempage extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Itempage> {
  CollectionReference track = FirebaseFirestore.instance.collection('Tracker');

  final name = TextEditingController();
  final quantity = TextEditingController();
  final type = TextEditingController();
  

  CollectionReference x = FirebaseFirestore.instance.collection('Owners');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Itempage'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Product Name'),
          ),
          TextField(
            controller: quantity,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter the Quantity'),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Is it a baby Porduct'),
          ),
          TextField(
            controller: type,
            decoration:
                InputDecoration(border: OutlineInputBorder(), hintText: 'Type'),
          ),
          FloatingActionButton(
            onPressed: () {
              x.doc('aNB4jygQ73cuR5BhdwP7').collection('items').add({
                'Name': name.text,
                'Type': type.text,
                'Quantity': quantity.text
              }).then((querySnapshot) {
                // Here whe call the document just after creation

                generatedID = querySnapshot.id
                    .toString(); // Here we call the ID of the document
              });

              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Qrcode()));
            },
            child: Text('Add'),
          )
        ],
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
