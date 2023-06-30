
import 'package:electrity_fault_reportor/utils/list_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsUpdate(),
    );
  }
}

class NewsUpdate extends StatefulWidget {
  NewsUpdate({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsUpdateState createState() => _NewsUpdateState();
}

class _NewsUpdateState extends State<NewsUpdate> {
  //String _apiKey = '46d80623a9ba4a97847da2b6cd84d3bd';
  //String usedAPi call = "https://newsapi.org/v2/top-headlines?country=za&pageSize=100&apiKey=";
  // String _urlforEskom = "'https://newsapi.org/v2/top-headlines?q='Eskom'&country=za&pageSize=100&apikey=",
  //String defaultLink = "https://newsapi.org/v2/everything?q=eskom&pageSize=100&apiKey="
  List _bottomItems = [
    {"icon": FontAwesomeIcons.fire, "index": 0},
    {"icon": FontAwesomeIcons.moneyBillAlt, "index": 1},
    {"icon": FontAwesomeIcons.bell, "index": 2},
    {"icon": FontAwesomeIcons.futbol, "index": 3},
  ];

  String _apiKey = '46d80623a9ba4a97847da2b6cd84d3bd';

  int _currentTab = 0;
  String _apiUrl = '';
  int _total = 0;
  List _articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    changeTab(index: 0);
  }

  void changeTab({int index = 0}) {
    //tab1 is about top-headlines
    //tab2 is about bitcoins
    //tab3 = apple
    //tab4 = techcrunch

    switch (index) {
      case 0:
        _apiUrl =
            'https://newsapi.org/v2/everything?q=eskom&pageSize=100&apikey=' +
                _apiKey;
        break;
      case 1:
        _apiUrl =
            'https://newsapi.org/v2/top-headlines?country=za&category=business&pageSize=100&apiKey=' +
                _apiKey;
        break;
      case 2:
        _apiUrl =
            'https://newsapi.org/v2/top-headlines?country=za&category=entertainment&pageSize=100&apiKey=' +
                _apiKey;
        break;
      case 3:
        _apiUrl =
            'https://newsapi.org/v2/top-headlines?country=za&category=sports&pageSize=100&apiKey=' +
                _apiKey;
        break;
    }

    print(_apiUrl);

    setState(() {
      _loading = true;
      _total = 0;
      _articles = [];
    });

    http.get(_apiUrl).then((response) {
      var data = json.decode(response.body);
      setState(() {
        //_total = data['totalResults']; this works but gives an error..
        _total = data['articles'].length;
        _articles = data['articles'];
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest News",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 5.0,
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
      body: new SafeArea(child: _buildBody(context)),
    );
  }

  _buildBottomNavigation(BuildContext context) {
    var _items = <BottomNavigationBarItem>[];

    for (var item in _bottomItems) {
      _items.add(new BottomNavigationBarItem(
        icon: new Icon(
          item['icon'],
          color: Colors.black,
        ),
        title: new Text(''),
      ));
    }

    return new BottomAppBar(
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _bottomItems.map((x) {
          return new IconButton(
            icon: new Icon(
              x['icon'],
              color: _currentTab == x['index'] ? Colors.black : Colors.black38,
            ),
            onPressed: () {
              setState(() {
                _currentTab = x['index'];
              });
              changeTab(index: x['index']);
            },
          );
        }).toList(),
      ),
    );
  }

  _buildBody(BuildContext context) {
    if (_loading) {
      return new SpinKitCircle(
        color: Colors.black,
        size: 50.0,
      );
    }

    print(_articles);

    return new ListView.builder(
      itemBuilder: (context, int index) {
        return new Padding(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: new ListItem(data: _articles[index]),
        );
      },
      itemCount: _total,
    );
  }

  //testFun() {
  //   if (_total > 20){
      
  //      double _total = (_total ~/ 2);
  //   }
  // }
}
