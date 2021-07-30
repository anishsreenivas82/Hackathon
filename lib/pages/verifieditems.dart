import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/donor_dashboard.dart';
import 'package:flutterlogindesign/pages/verification.dart';

class Verified extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Verified> {

  final Stream<QuerySnapshot> _VerifiedOrders = FirebaseFirestore.instance
      .collection('Owners')
      .doc(uidDonor)
      .collection('verified items')
      .snapshots();
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(title: Text('Verified Donations'),centerTitle: true,backgroundColor: Colors.blue,),
      body: SafeArea(
              child: StreamBuilder<QuerySnapshot>(
          stream: _VerifiedOrders,
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
                return Container(
                  
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
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber,
                                  ),
                                  Center(
                                    child: Text(
                                      'Status:',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      
                                    ),
                                  ),
                                  Text(data['Status'],style: TextStyle(
                                        fontSize: 15,color: Colors.green)),
                                  SizedBox(
                                    width: 4,
                                  ),])]))))));

              }).toList(),
            );
          },
        ),
      ),
    );
  }
}