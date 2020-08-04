import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

var _key = GlobalKey();

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('F B'),
          onPressed: () => print('push the button'),
        ),
        appBar: AppBar(),
        body: ListView(
          children: <Widget>[
            RaisedButton(
              elevation: 3.0,
              child: Text('Raised Button'),
              onPressed: () => print("push the button"),
            ),
            FlatButton(
              child: Text('Flat Button'),
              onPressed: () => print('push the button'),
            ),
            IconButton(
              icon: Icon(Icons.cake),
              color: Colors.red,
              onPressed: () => print('push the button'),
            ),
            FloatingActionButton(
              child: Text('F B'),
              onPressed: () => print('push the button'),
            ),
            CupertinoButton(
              child: Text('Cupertino Button'),
              onPressed: () => print('push the button'),
            ),
            Dismissible(
              key: _key,
              background: Container(
                color: Colors.blue,
              ),
              secondaryBackground: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                print('You swiped $direction');
              },
              child: RaisedButton(
                elevation: 3.0,
                child: Text('Raised Button'),
                onPressed: () => print("push the button"),
              ),
            )
          ],
        ));
  }
}
