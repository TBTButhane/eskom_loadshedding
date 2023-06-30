import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electrity_fault_reportor/ui/screens/about_us.dart';
import 'package:electrity_fault_reportor/ui/screens/checkout.dart';
import 'package:electrity_fault_reportor/ui/screens/contact_us.dart';
import 'package:electrity_fault_reportor/ui/screens/customer_info.dart';
import 'package:electrity_fault_reportor/ui/screens/faqs.dart';
import 'package:electrity_fault_reportor/ui/screens/faults.dart';
import 'package:electrity_fault_reportor/ui/screens/issues.dart';
import 'package:electrity_fault_reportor/ui/screens/loadshedding.dart';
import 'package:electrity_fault_reportor/ui/screens/main_screen.dart';
import 'package:electrity_fault_reportor/ui/screens/news_update.dart';
import 'package:electrity_fault_reportor/ui/screens/payments.dart';
import 'package:electrity_fault_reportor/ui/screens/root_screen.dart';
import 'package:electrity_fault_reportor/ui/screens/services_update.dart';
import 'package:electrity_fault_reportor/ui/screens/sign_in.dart';
import 'package:electrity_fault_reportor/ui/screens/sign_up.dart';
import 'package:electrity_fault_reportor/ui/screens/walk_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.instance.settings(timestampsInSnapshotsEnabled: true);
  SharedPreferences.getInstance().then((prefs) {
      runApp(MyApp(prefs: prefs));
  });
} 

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  MyApp({this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electricity Fault Reporter',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/walkthrough': (BuildContext context) => new WalkthroughScreen(),
        '/load': (BuildContext context) => new Loadshedding(),
        '/news': (BuildContext context) => new NewsUpdate(),
        '/store': (BuildContext context) => new Issues(),
        '/chat': (BuildContext context) => new ChatMessage(),
        '/service': (BuildContext context) => new Update(),
        '/profile': (BuildContext context) => new Info(),
        '/faq': (BuildContext context) => new Questions(),
        '/contact': (BuildContext context) => new Contacts(),
        '/about': (BuildContext context) => new AboutApp(),
        '/root': (BuildContext context) => new RootScreen(),
        '/payment':(BuildContext contact) => new PaymentScreen(),
        '/payment':(BuildContext contact) => new CheckOutPage(),
        '/signin': (BuildContext context) => new SignInScreen(),
        '/signup': (BuildContext context) => new SignUpScreen(),
        '/main': (BuildContext context) => new MainScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _dealWithCurrentScreen(),
    );
  }


  Widget _dealWithCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      return new RootScreen();
    } else {
      return new WalkthroughScreen(prefs: prefs);
    }
  }
}

