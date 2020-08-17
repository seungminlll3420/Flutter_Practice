import 'package:flutter/material.dart';
import 'package:real_instagram_clon/main_page.dart';
import 'package:real_instagram_clon/screens/auth_page.dart';
import 'package:real_instagram_clon/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: white),
      home: AuthPage(),
    );
  }
}
