import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/donor_dashboard.dart';
import 'package:flutterlogindesign/pages/item_page.dart';
import 'package:flutterlogindesign/pages/qr.dart';

class PendingOrders extends StatefulWidget {
  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  final Stream<QuerySnapshot> _PendingOrderStream = FirebaseFirestore.instance
      .collection('Owners')
      .doc(uidDonor)
      .collection('items')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _PendingOrderStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return new ListTile(
                title: new Text(data['Name'].toString()),
                subtitle: new Text(data['Type'].toString()),
                onTap: () => {
                  generatedID = document.id,
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Qrcode()))
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}


// CollectionReference _collectionRef =
//     FirebaseFirestore.instance.collection('Owners').doc('aNB4jygQ73cuR5BhdwP7').collection('items');

// Future<void> getData() async {
//     // Get docs from collection reference
//     QuerySnapshot querySnapshot = await _collectionRef.get();

//     // Get data from docs and convert map to List
//     final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

//     return allData;
// }



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
