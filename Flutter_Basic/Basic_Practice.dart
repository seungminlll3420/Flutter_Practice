import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  //정적 화면을 구성함. 기본 틀을 구성할때 쓰임

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HelloPags("Hello, World"));
  }
}
// stful + Enter

class HelloPags extends StatefulWidget {  //동적인 화면을 구성할때 필요. 기본틀에 들어갈 요소들을 구성할때 쓰임.
  //화면 변경 ㅇㅇ
  final String title;

  HelloPags(this.title);

  @override
  _HelloPagsState createState() => _HelloPagsState();
}

class _HelloPagsState extends State<HelloPags> {
  String _message = 'Hello_World';
  int _counter = 0; // 변수 앞에 _ 를 붙이면 private 속성이 적용됨, 없으면 public.

// Flutter는 Widget으로 시작해 Widget으로 끝난다.
//  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(  // 버튼
          child: Icon(Icons.add), onPressed: _changeMassage), // onPressed -> 버튼이 눌릴경우 뒤에있는 명력어 실행, 현재는 _changeMassage method가 실행됨
      appBar: AppBar(
        title: Text(widget.title), // widget.title 에서 widget는 HelloPags class를 참조.
      ),
      body: Center(child: Column( // Child -> 한개이하의 Widget 가질경우 사용
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ //// Child -> 한개초과의 Widget 가질경우 사용
          Text(_message, style: TextStyle(fontSize: 20)),
          Text('$_counter', style: TextStyle(fontSize: 20)), // Text()의 첫번째 파라미터는 String속성이다. String 이외의 변수를 사용하려면 '$Val'으로 사용.
        ],
      )
    )
      );
  }

  void _changeMassage() {  // 이는 IDE 단축키로 간편생성가능. 해당 method를 드래그 후 Alt + Enter후 method 생성 하면 된다.
    setState(() { // 상태 변경을 할때 사용하는 method
      if(_counter%2 == 0) {
        _message = "Hello, Flutter";
      }else{
        _message = "Hello, World";
      }
      _counter++;
    });
  }
}
