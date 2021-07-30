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

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(title: Text('Pending Verification'),centerTitle: true,backgroundColor: Colors.blue,),
      body: SafeArea(
              child: StreamBuilder<QuerySnapshot>(
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
                return  Container(
                  child:Container(
                  height: height * 0.40,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.01, height * 0.01, width * 0.01, height * 0.01),
                  child: Container(
                    child: new Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width*0.1),
                      ),
                      child: InkWell(
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.04),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Name:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Name'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Type:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Type'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Quantity:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Quantity'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Is it a Baby Product? :',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(data['Baby'].toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              
                                  SizedBox(
                                    width: 4,
                                  )])))))));

              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

// class PendingOrders extends StatefulWidget {

//   @override
//   _PendingOrdersState createState() => _PendingOrdersState();
// }

// class _PendingOrdersState extends State<PendingOrders> {

//    final Stream<QuerySnapshot> _PendingOrderStream = FirebaseFirestore.instance
//       .collection('Owners')
//       .doc(uidDonor)
//       .collection('items')
//       .snapshots();
//   @override
//   Widget build(BuildContext context) {

//        return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _PendingOrderStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text("Loading");
//           }

//           return new ListView(
//             children: snapshot.data.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//                   document.data() as Map<String, dynamic>;
//                   return new ListTile(

//                   )

//     );
//   }
// }

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
