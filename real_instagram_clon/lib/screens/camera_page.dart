import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _selectedPage = 1;
  var _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('GALLERY'),
              icon: ImageIcon(AssetImage('assets/home.png'))),
          BottomNavigationBarItem(
              title: Text('PHOTO'),
              icon: ImageIcon(AssetImage('assets/home.png'))),
          BottomNavigationBarItem(
              title: Text('VIDEO'),
              icon: ImageIcon(AssetImage('assets/home.png'))),
        ],
        currentIndex: _selectedPage,
        onTap: (index) => _onItemTapped(context, index),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        children: [_grlleryPage(), _takePhotoPage(), _takeVideoPage()],
      ),
    );
  }

  Widget _grlleryPage() {
    return Container(
      color: Colors.purple,
    );
  }

  Widget _takePhotoPage() {
    return Container(
      color: Colors.blue,
    );
  }

  Widget _takeVideoPage() {
    return Container(
      color: Colors.orange,
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
