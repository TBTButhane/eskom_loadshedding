import 'package:electrity_fault_reportor/ui/screens/faults.dart';
import 'package:electrity_fault_reportor/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:eskom_report_app/Register.dart';
// import 'package:eskom_report_app/login.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Loadshedding extends StatelessWidget {
 


  Material myItems(IconData icon, String heading, int color){
    return Material(
      color: Colors.white,
        elevation: 14.0,
        shadowColor: Colors.black,
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
                )
                )
                )
    );
  }



  // void _signOut() async {
  //   try {
  //     await auth.signOut();
  //     onSignedOut();
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 8.0,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('home page'),
      ),
      body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 15.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          children: <Widget>[
            
            InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //     new CupertinoPageRoute(builder: (BuildContext context) {
                //       return new NewsUpdate();
                //     })
                //   );
              },
              child: myItems(Icons.cast, "Loadshedding Schedule", 0xfFF57331)),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                      return new ChatMessage();
                    })
                  );
              },
              child: myItems(Icons.report_problem, "Report Faults", 0xfFF57331)),
            
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //     new CupertinoPageRoute(builder: (BuildContext context) {
                //       return new Questions();
                //     })
                //   );
              },
              child: myItems(Icons.help_outline, "view all faults",0xfFF57331)),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //     new CupertinoPageRoute(builder: (BuildContext context) {
                //       return new Contacts();
                //     })
                //   );
              },
              child: myItems(Icons.person, "Profile",0xfFF57331)),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 130.0),
            StaggeredTile.extent(1, 150.0),
            StaggeredTile.extent(1, 150.0),
            StaggeredTile.extent(2, 130.0),
            
          ])
    );
  }
  void _logOut() async {
    Auth.signOut();
  }
}


