import 'package:electrity_fault_reportor/models/user.dart';
import 'package:electrity_fault_reportor/utils/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Info extends StatefulWidget {
  final FirebaseUser firebaseUser;
  Info({this.firebaseUser});

  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback onBackPress;

  tryMethod() async {
    final FirebaseUser findUser = await FirebaseAuth.instance.currentUser();
    final uid = findUser.uid;
    if (Auth.getUser(widget.firebaseUser.uid) != uid) {
      Auth.getUser(widget.firebaseUser.uid) == uid;
    } else {
      return Center(
          child: Column(
            children: <Widget>[
              CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromRGBO(212, 20, 15, 1.0),
        ),
      ),
      Text("Please wait..!!", style: TextStyle(color: Colors.black, fontSize: 20.0))
            ],
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    print(widget.firebaseUser);
    onBackPress = () {
      Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "Customer Info",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          elevation: 5.0,
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: Auth.getUser(
              widget.firebaseUser == null ? null : tryMethod()),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(212, 20, 15, 1.0),
                ),
              ));
            } else {
              return Container(
                color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      enabled: false,
                      title: Text('User Details:',
                          style: TextStyle(
                              fontSize: 35.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {},
                        title: Text('UserNames:',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data.firstName}"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        enabled: true,
                        title: Text('Email:',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data.email}"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        enabled: true,
                        title: Text('Phone:',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data.phoneNumbers}"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        enabled: true,
                        title: Text('Password:',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        enabled: true,
                        title: Text('Meter No:',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text("${snapshot.data.meterNumber}"),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
