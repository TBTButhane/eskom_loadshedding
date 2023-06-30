import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutApp(),
    );
  }
}

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "About us",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 5.0,
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 1, right: 1),
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
                        child: new Image.asset("assets/images/aboutus.jpg"),
                        borderRadius: BorderRadius.only(
                          topLeft: new Radius.circular(16.0),
                          topRight: new Radius.circular(16.0),
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text("Owner: Kgaogelo",
                                style: Theme.of(context).textTheme.title),
                            new SizedBox(height: 16.0),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text("Author:", style: TextStyle(fontSize: 15.0),),
                                new Text("Made by: HostTree", style: TextStyle(fontSize: 15.0),),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                "Read About US",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87,
                                ),
                              ),
                              children: <Widget>[
                                Text(
                                  "This Mobile application was created for the sole perpose of helping people",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                )
                              ],
                            ),
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
