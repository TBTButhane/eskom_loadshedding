import 'package:electrity_fault_reportor/ui/screens/faults_exten1.dart';
import 'package:flutter/material.dart';


class ChatMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example Dialogflow Flutter',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new HomePageDialogflow(),
    );
  }
}