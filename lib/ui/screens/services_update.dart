import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Update(),
    );
  }
}

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Service Update",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 5.0,
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Service Coming Soon ...", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),),
        ),
      ),
    );
  }
}
