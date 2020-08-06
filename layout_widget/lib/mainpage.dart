import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var sb = SnackBar(
    content: Text("dhdhhdh"),
    duration: Duration(seconds: 5),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: () {},
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text('dd'),
            FloatingActionButton(
              onPressed: () => {Scaffold.of(context).showSnackBar(sb)},
            ),
          ],
        ),
      ),
    );
  }
}
