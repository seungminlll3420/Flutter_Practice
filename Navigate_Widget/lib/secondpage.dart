import 'package:flutter/material.dart';
import 'information.dart';

class SecondPage extends StatelessWidget {
  Information _information;
  SecondPage(this._information);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(
              Icons.nature_people,
              color: Colors.blue,
              size: 100,
            ),
          ),
          Text(_information.name),
          Text(_information.email),
          Text(_information.pon_number),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('첫번째 페이지로 가기'),
          )
        ],
      ),
    );
  }
}
