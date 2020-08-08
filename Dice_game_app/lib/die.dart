import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Die extends StatefulWidget {
  @override
  _DieState createState() => _DieState();
}

class _DieState extends State<Die> {
  int die = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Dice game!',
          textAlign: TextAlign.left,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.asset('images/dice$die.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: RaisedButton(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  color: Colors.orangeAccent,
                  onPressed: () {
                    setState(() {
                      die = Random().nextInt(6) + 1;
                    });

                    showToast("dice: $die");
                  }),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
