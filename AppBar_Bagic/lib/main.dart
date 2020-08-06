import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyPage());
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        centerTitle: true,
        title: Text(
          'AppBar Bagic',
          style: TextStyle(height: 1, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/moomin02.png'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: Text('이승민'),
              accountEmail: Text('mm3420@naver.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/moomin01.jpeg'),
                backgroundColor: Colors.white,
              ),
              onDetailsPressed: () {},
              decoration: BoxDecoration(
                  color: Colors.greenAccent[700],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text(
                'home',
                style: TextStyle(color: Colors.grey[850]),
              ),
              onTap: () {},
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text(
                'settings',
                style: TextStyle(color: Colors.grey[850]),
              ),
              onTap: () {},
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text(
                'Q&A',
                style: TextStyle(color: Colors.grey[850]),
              ),
              onTap: () {},
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
