import 'package:electrity_fault_reportor/models/user.dart';
import 'package:electrity_fault_reportor/ui/screens/about_us.dart';
import 'package:electrity_fault_reportor/ui/screens/contact_us.dart';
import 'package:electrity_fault_reportor/ui/screens/customer_info.dart';
import 'package:electrity_fault_reportor/ui/screens/faqs.dart';
import 'package:electrity_fault_reportor/ui/screens/issues.dart';
import 'package:electrity_fault_reportor/ui/screens/loadshedding.dart';
import 'package:electrity_fault_reportor/ui/screens/news_update.dart';
import 'package:electrity_fault_reportor/ui/screens/payments.dart';
import 'package:electrity_fault_reportor/ui/screens/services_update.dart';
import 'package:electrity_fault_reportor/utils/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainScreen extends StatefulWidget {
  final FirebaseUser firebaseUser;

  MainScreen({this.firebaseUser});

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(widget.firebaseUser);
  }

  // Material Items
  Material myItems(IconData icon, String heading, int color) {
    return Material(
        color: Colors.white,
        elevation: 14.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(24.0),
        child: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //text
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            heading,
                            style:
                                TextStyle(color: Color(color), fontSize: 20.0),
                          ),
                        ),

                        //Icon
                        Material(
                          color: Color(color),
                          borderRadius: BorderRadius.circular(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              icon,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: new IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: Text("Home",
            style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            StreamBuilder(
              stream: Auth.getUser(widget.firebaseUser.uid),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (!snapshot.hasData) {
                  return UserAccountsDrawerHeader(
                    accountName: new Text(
                      'UnknownUser',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0),
                    ),
                    accountEmail: Text("User Email Unknown"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "k",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 40.0,
                            color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return UserAccountsDrawerHeader(
                    accountName: Text("Name: ${snapshot.data.firstName}"),
                    accountEmail: Text("Email: ${snapshot.data.email}"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text("${snapshot.data.firstName}"),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Icon(
                Icons.person,
                color: Colors.green,
                size: 30.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/profile");
              },
            ),
            ListTile(
              title: Text(
                "Report",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Icon(
                Icons.message,
                color: Colors.green,
                size: 30.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/chat");
              },
            ),
            Divider(
              color: Colors.green,
              height: 15.0,
            ),
            ListTile(
              title: Text(
                "Local Electricity Store",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Icon(
                Icons.location_on,
                color: Colors.green,
                size: 30.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/store");
              },
            ),
            ListTile(
              title: Text(
                "Purchase",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Icon(
                Icons.shopping_cart,
                color: Colors.green,
                size: 30.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new PaymentScreen();
                  }));
                
              },
            ),
            Divider(
              color: Colors.green,
              height: 15.0,
            ),
            ListTile(
              title: Text(
                "Customer Services",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Icon(
                Icons.receipt,
                color: Colors.green,
                size: 30.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/service");
              },
            ),
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Icon(
                Icons.settings,
                color: Colors.green,
                size: 30.0,
              ),
            ),
            ListTile(
              title: Text('Log Out',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              onTap: () {
                _logOut();
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
      ),
      body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new Loadshedding();
                  }));
                },
                child: myItems(
                    Icons.info_outline, "Loadshedding Info", 0xff4d79ff)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new NewsUpdate();
                  }));
                },
                child: myItems(Icons.cast, "News update", 0xff4d79ff)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new Issues();
                  }));
                },
                child: myItems(Icons.store, "Store location", 0xff4d79ff)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new Update();
                  }));
                },
                child: myItems(Icons.update, "Service Update", 0xff4d79ff)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new Info();
                  }));
                },
                child: myItems(Icons.info, "Customer info", 0xff4d79ff)),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new Questions();
                  }));
                },
                child: myItems(Icons.help_outline, "FAQ's", 0xff4d79ff)),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new Contacts();
                  }));
                },
                child: myItems(Icons.call, "Contact Us", 0xff4d79ff)),
            GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed('/about');
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new AboutApp();
                  }));
                },
                child: myItems(Icons.person, "About Us", 0xff4d79ff)),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 130.0),
            StaggeredTile.extent(1, 150.0),
            StaggeredTile.extent(1, 150.0),
            StaggeredTile.extent(2, 150.0),
            StaggeredTile.extent(2, 150.0),
            StaggeredTile.extent(1, 150.0),
            StaggeredTile.extent(1, 150.0),
            StaggeredTile.extent(2, 130.0),
          ]),
    );
  }

  void _logOut() async {
    Auth.signOut();
  }
}
