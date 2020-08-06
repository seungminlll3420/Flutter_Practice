import 'package:flutter/material.dart';
import 'information.dart';

class SecondPage extends StatelessWidget {
  Information _information;
  SecondPage(this._information);
  var input = TextEditingController();
  String test;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: IconButton(
              icon: Icon(Icons.nature_people),
              iconSize: 180,
              color: Colors.blue,
              onPressed: () {},
            ),
          ),
          Text(_information.name),
          Text(_information.email),
          Text(_information.pon_number),
          TextField(
            controller: input,
            onChanged: (value) {
              test = value;
            },
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, test);
            },
            child: Text('입력하기'),
          )
        ],
      ),
    );
  }
}
