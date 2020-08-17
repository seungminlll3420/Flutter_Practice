import 'package:flutter/material.dart';

void simpleSnackBar(BuildContext context, String txt) {
  final snackBar = SnackBar(content: Text(txt));
  Scaffold.of(context).showSnackBar(snackBar);
}
