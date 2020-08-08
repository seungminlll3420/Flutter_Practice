import 'package:flutter/material.dart';
import 'package:Dice_game_app/login.dart';
import 'package:Dice_game_app/choice.dart';
import 'package:Dice_game_app/die.dart';
import 'package:Dice_game_app/dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/choice': (context) => Choice(),
        '/die': (context) => Die(),
        '/dice': (context) => Dice()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
