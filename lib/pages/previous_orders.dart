

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('Owners').doc('aNB4jygQ73cuR5BhdwP7').collection('items');

Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData;
}



// class Example extends StatelessWidget {
//    var listOfWidgets = [];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount:, //number of items 
//       itemBuilder: (BuildContext context, int index) => StreamBuilder(

//           stream: FirebaseFirestore.instance
//               .collection("Owners")
//               .doc('aNB4jygQ73cuR5BhdwP7').collection('items')
//               .where("Item$index.quantity", isGreaterThanOrEqualTo: 1)
//               .snapshots(),
//           builder:  
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (!snapshot.hasData) return new Text("There is no expense");
//                    return listOfWidgets;
//               }),
//     );
//   }

//   getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {

//     var item = snapshot.data.documents
//         .map((doc) => new ListTile(
//             title: new Text(doc["Item$index.Name"]),
//             subtitle: new Text(doc["Item$index.quantity"])))
//         .toList();
//     listOfWidgets.add(item);
//   }
// }
