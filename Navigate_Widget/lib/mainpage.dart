import 'secondpage.dart';
import 'package:flutter/material.dart';
import 'information.dart';
import 'dart:core';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _controller_name = TextEditingController();
  var _controller_pon = TextEditingController();
  var _controller_email = TextEditingController();
  String email;
  String name;
  String pon_number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Icon(
              Icons.cake,
              color: Colors.red,
              size: 100,
            )),
            TextField(
                controller: _controller_name,
                onChanged: (name_v) {
                  setState(() {
                    name = name_v;
                  });
                },
                decoration: InputDecoration(
                    labelText: "name",
                    hintText: "your namer",
                    icon: Icon(Icons.people))),
            TextField(
                controller: _controller_email,
                onChanged: (email_v) {
                  setState(() {
                    email = email_v;
                  });
                },
                decoration: InputDecoration(
                    labelText: "email",
                    hintText: "1234@ex.com",
                    icon: Icon(Icons.email))),
            TextField(
                controller: _controller_pon,
                onChanged: (pon_number_v) {
                  setState(() {
                    pon_number = pon_number_v;
                  });
                },
                decoration: InputDecoration(
                    labelText: "pon_Number",
                    hintText: "010-1234-5678",
                    icon: Icon(Icons.phone_iphone))),
            RaisedButton(
              child: Text('두번째 페이지 가기'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondPage(Information(email, pon_number, name)),
                  ),
                );
              },
            )
          ],
        ));
  }
}
