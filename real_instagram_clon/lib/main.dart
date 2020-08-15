import 'package:flutter/material.dart';
import 'package:real_instagram_clon/main_page.dart';
import 'package:real_instagram_clon/screens/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: white),
      home: MainPage(),
    );
  }
}
