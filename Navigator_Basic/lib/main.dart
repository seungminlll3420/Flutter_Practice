import 'package:flutter/material.dart';
import 'ScreenA.dart';
import 'ScreenB.dart';
import 'ScreenC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenA(),
        '/B': (context) => ScreenB(),
        '/C': (context) => ScreenC()
      },
    );
  }
}

// 아래는 단순 2개의 페이지만 사용한 경우
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to the Second page'),
          onPressed: () {
            // 여기서 사용되는 context는 현재 First Page의 정확한 위치에대해 알기 위해 사용된다.
            // 하지만 필요없을때(지금은 이미 context를 넣어줘서 builder에서 context사용할 필요가 없다.)는 _ 로 넣어서 표현가능하다.
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SecondPage(),
                ));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to the First page'),
          onPressed: () {
            Navigator.pop(ctx);
          },
        ),
      ),
    );
  }
}
