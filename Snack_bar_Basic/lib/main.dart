import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: YourPage(),
    );
  }
}

class YourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text('Snack_Bar_Basic'),
        centerTitle: true,
      ),
      body: _MySnackBar(),
    );
  }
}

class _MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        color: Colors.greenAccent,
        child: Text('Show me'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'Hello',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.greenAccent,
            duration: Duration(milliseconds: 2000),
          ));
          // 현재의 content는 _MySnackBar의 content를 사용한다.
          //그렇기때문에 이전 상황과 다르게 content를 찾기 시작 하는 지점이 Scaffold 아래이기 때문에 문제없이 스낵바를 사용할 수 있다.
        },
      ),
    );
  }
}

// 아래는 Builder를 사용하여 스낵바를 출력하는 예이다
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text('Snack_Bar_Basic'),
          centerTitle: true,
        ),
        body: Builder(builder: (BuildContext ctx) {
          return Center(
            child: FlatButton(
              onPressed: () {
                Scaffold.of(ctx).showSnackBar(SnackBar(
                  content: Text(
                    'Hello',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.greenAccent,
                ));
              },
              color: Colors.green,
              child: Text(
                "Show me",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        })
        // 이걸 사용하면 오류남
        // body: Center(
        //   child: FlatButton(
        //     onPressed: () {

        //       // 문법 Scaffold.of(context) context를 이용해 Scaffold를 찾아 위로 올라간다.
        //       // Scaffold.of(context).showSnackBar(SnackBar(
        //       //     content: Text(
        //       //         'Hello'))); // 여기서 사용한 context는 MyPage의 것이다.
        //       //그래서 MyPage 위로 계속 Scaffold를 찾아 나서지만 Scaffold는 MyPage 아래에 있기때문에 찾지 못해 오류가 발생한다.
        //     },
        //     color: Colors.green,
        //     child: Text(
        //       "Show me",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
        );
  }
}
