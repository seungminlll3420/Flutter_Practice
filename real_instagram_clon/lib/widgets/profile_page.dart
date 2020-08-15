import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpend = false;
  Size _size;
  double menuWidth;
  int duration = 200;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    menuWidth = _size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: [_sideMenu(), _profile()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _menuOpend = !_menuOpend;
          });
        },
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      color: Colors.yellow,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
        _menuOpend ? _size.width - menuWidth : _size.width,
        0,
        0,
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.green,
      duration: Duration(
        milliseconds: duration,
      ),
      transform: Matrix4.translationValues(
        _menuOpend ? -menuWidth : 0,
        0,
        0,
      ),
    );
  }
}
