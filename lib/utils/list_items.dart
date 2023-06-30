
import 'package:electrity_fault_reportor/utils/detail.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return new Card(
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
              child: new Image.network(
                data['urlToImage'] ?? 'https://via.placeholder.com/400x200',
              ),
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
                  new Text(data['title'],
                      style: Theme.of(context).textTheme.title),
                  new SizedBox(height: 16.0),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(data['publishedAt'].toString().substring(0, 10)),
                      new Text(data['source']['name']),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => new DetailPage(data: this.data)));
        },
      ),
    );
  }
}
