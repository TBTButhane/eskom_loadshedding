import 'package:electrity_fault_reportor/ui/screens/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Buy Electricity",
            style: TextStyle(),
          ),
        ),
        body: Container(
          color: Colors.white,
          //padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(children: <Widget>[
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text("Enter Amount:"),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'R 1 - R 1000'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text("Enter Meter No:"),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '123456789'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text("SMS Token To"),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '+27 71234567'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
               height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  
                    color: Colors.grey,
                    padding: EdgeInsets.all(15),
                    onPressed: () {},
                    child: Text("Cancel")),
                SizedBox(
                  width: 15,
                ),
                FlatButton(
                    color: Colors.green,
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new CheckOutPage();
                  }));
                    },
                    child: Text("Proceed to Payment")),
              ],
            )
          ]),
        ));
  }
}
