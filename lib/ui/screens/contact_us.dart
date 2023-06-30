import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Contacts(),
    );
  }
}

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact us",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 5.0,
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(16.0),
                ),
                child: new InkWell(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new ClipRRect(
                        child: new Image.asset("assets/images/contact-us.png"),
                        borderRadius: BorderRadius.only(
                          topLeft: new Radius.circular(6.0),
                          topRight: new Radius.circular(6.0),
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text("Contact Details",
                                style: Theme.of(context).textTheme.title),
                            SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Email :", style: TextStyle(fontSize: 19.0)),
                                    Text("FAX :", style: TextStyle(fontSize: 19.0)),
                                    Text("WebSite :",
                                        style: TextStyle(fontSize: 19.0)),
                                    Text("Landline :",
                                        style: TextStyle(fontSize: 19.0)),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Kgaogelo@gmail.com", style: TextStyle(fontSize: 19.0)),
                                    Text("08157555888", style: TextStyle(fontSize: 19.0)),
                                    Text("EFR.co.za",
                                        style: TextStyle(fontSize: 19.0)),
                                    Text("(210) 233 2331",
                                        style: TextStyle(fontSize: 19.0)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => new DetailPage(data: this.data))
                  //      );
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
