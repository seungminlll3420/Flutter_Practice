import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.primaries[0],
    ),
    Container(
      color: Colors.primaries[1],
    ),
    Container(
      color: Colors.primaries[2],
    ),
    Container(
      color: Colors.primaries[3],
    ),
    Container(
      color: Colors.primaries[4],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real_Instagram_clon'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey[900],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/home_selected.png",
              iconPath: "assets/home.png"),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/search_selected.png",
              iconPath: "assets/search.png"),
          _buildBottomNavigationBarItem(
            iconPath: "assets/add.png",
          ),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/heart_selected.png",
              iconPath: "assets/heart.png"),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/profile_selected.png",
              iconPath: "assets/profile.png"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {String activeIconPath, String iconPath}) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(iconPath)),
      title: Text(''),
      activeIcon:
          activeIconPath == null ? null : ImageIcon(AssetImage(activeIconPath)),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
