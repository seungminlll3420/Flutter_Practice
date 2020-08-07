import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.greenAccent,
              child: Text('ScreenB'),
              onPressed: () {
                Navigator.pushNamed(context, '/B');
              },
            ),
            RaisedButton(
              color: Colors.greenAccent,
              child: Text('ScreenC'),
              onPressed: () {
                Navigator.pushNamed(context, '/C');
              },
            ),
          ],
        ),
      ),
    );
  }
}
