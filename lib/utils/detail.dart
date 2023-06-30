
import 'package:electrity_fault_reportor/utils/html.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: 200.0,
          snap: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
            background: Image.network(
              widget.data['urlToImage'] ??
                  'https://images.unsplash.com/photo-1545922273-c62f29664d37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
              fit: BoxFit.cover,
            ),
          ),
        ),
        new SliverFillRemaining(
          child: new Padding(
            padding: new EdgeInsets.all(24.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  widget.data['title'],
                  style: Theme.of(context).textTheme.title,
                ),
                new SizedBox(height: 12.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(widget.data['author'] ?? ''),
                    new Text(widget.data['source']['name']),
                  ],
                ),
                new SizedBox(height: 12.0),
                new Divider(),
                new SizedBox(height: 12.0),
                new Text(widget.data['description']),
                new SizedBox(height: 12.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(FontAwesomeIcons.angleRight),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                new WebPage(data: widget.data)));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  widget.data['urlToImage'] ??
                      'https://images.unsplash.com/photo-1545922273-c62f29664d37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: new Padding(
        padding: new EdgeInsets.all(24.0),
        child: new Column(
          children: <Widget>[
            new Text(
              widget.data['title'],
              style: Theme.of(context).textTheme.title,
            ),
            new SizedBox(height: 12.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(widget.data['author']),
                new Text(widget.data['source']['name']),
              ],
            ),
            new SizedBox(height: 12.0),
            new Divider(),
            new SizedBox(height: 12.0),
            new Text(widget.data['description']),
          ],
        ),
      ),
    );
  }
}
