import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class HomePageDialogflow extends StatefulWidget {
  final FirebaseUser firebaseUser;
  HomePageDialogflow({Key key, this.title, this.firebaseUser, this.leading})
      : super(key: key);

  final String title;
  final String leading;

  @override
  _HomePageDialogflow createState() => new _HomePageDialogflow();
}

class _HomePageDialogflow extends State<HomePageDialogflow> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  VoidCallback onBackPress;

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(hintText: "Say Hi"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Electricity Fault Reporter",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  void initState() {
    super.initState();
    onBackPress = () {
      Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back) ,
            onPressed: null,
          ),
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: new Text("Electricity Fault Reporter"),
        ),
        body: new Column(children: <Widget>[
          new Flexible(
              child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ]),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child:
            new CircleAvatar(child: new Image.asset("assets/images/img1.jpg")),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // new Text(this.name,
            //     style: new TextStyle(fontWeight: FontWeight.bold)),
            // new Container(
            //   margin: const EdgeInsets.only(top: 5.0),
            //   child: new Text(text),
            // ),
            Padding(
                    padding: EdgeInsets.only(right: 48.0),
                    child: Text(this.name,
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                  ),
            Container(
              margin: const EdgeInsets.all(3.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1.0,
                        color: Colors.black.withOpacity(0.12))
                  ],
                  color: Colors.green.withOpacity(0.50),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(5.0)),),
              child: Stack(
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.all(5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
                    padding: EdgeInsets.only(left: 48.0),
                    child: Text(this.name,
                        style: Theme.of(context).textTheme.subhead),
                  ),
            Container(
              margin: const EdgeInsets.all(3.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1.0,
                        color: Colors.black.withOpacity(0.12))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(5.0)),),
              child: Stack(
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.all(5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(child: new Text(this.name[0])),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
