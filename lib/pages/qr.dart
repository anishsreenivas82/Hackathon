import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogindesign/pages/donor_dashboard.dart';
import 'package:flutterlogindesign/pages/item_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Qrcode extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Qrcode> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.amber[800],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.3, 0, height * 0.01),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.amber[800],
                      ),
                      child: BarcodeWidget(
                        barcode: Barcode.qrCode(),
                        color: Colors.black,
                        data: generatedID ?? "Hello World",
                        width: 200,
                        height: 200,
                      ),
                    )),
                    SizedBox(height: height * 0.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Add more items.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Itempage()));
                          },
                          child: Text('Add'),
                        ),
                        FloatingActionButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg: "Process complete.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Donor()));
                            },
                            child: Text('Finish'))
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
