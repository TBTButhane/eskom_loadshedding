import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Frequently extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Questions(),
    );
  }
}
class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("F.A.Qs", style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 5.0,
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),

      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: <Widget>[
              Card(
                //color: Colors.blueGrey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ExpansionTile(title: Text("Will this App help resolve issues?", style: Theme.of(context).textTheme.title,),
                    children: <Widget>[
                      Text("HEllo HEllo Hello Hello Hello, Hello Hello Hello, Hello Hello Hello", style: TextStyle(fontSize: 18.0, color: Colors.black),)
                    ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}