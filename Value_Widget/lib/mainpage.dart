import 'package:flutter/material.dart';

enum SearchType { seung, min, youn }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _controller = TextEditingController();
  var _searchTerm = "";
  bool _bool_val = true;
  double _double_val = 0;

  SearchType _searchType = SearchType.seung;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  //                                   아이콘 위젯(아이콘 출력)
                  child: Icon(
                    Icons.cake,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
                //                                     텍스트 위젯 (텍스트 출력)
                Text(
                  '아래에 입력하세요!',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                //                                     텍스트필드 위엣(사용자 입력)
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _controller,
                  onChanged: (var val) {
                    setState(() {
                      _searchTerm = val;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: "email",
                      hintText: "1234@naver.com",
                      icon: Icon(Icons.phone_iphone)),
                ),
                Text(_searchTerm,
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
                //                                               체크박스 위젯( ㅇㅇ)
                Checkbox(
                  value: _bool_val,
                  onChanged: (var val) {
                    setState(() {
                      _bool_val = val;
                    });
                  },
                ),
                //                                               스위치 위젯(체크박스랑 모양만 다름)
                Switch(
                  value: _bool_val,
                  onChanged: (var val) {
                    setState(() {
                      _bool_val = val;
                    });
                  },
                ),

                //                                        레디오 위젯(여러 체크박스를 선택할때 사용)
                Row(
                  children: <Widget>[
                    Radio<SearchType>(
                      groupValue: _searchType,
                      value: SearchType.seung,
                      onChanged: (var val) {
                        setState(() {
                          _searchType = val;
                        });
                      },
                    ),
                    Text("seung"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<SearchType>(
                      groupValue: _searchType,
                      value: SearchType.min,
                      onChanged: (var val) {
                        setState(() {
                          _searchType = val;
                        });
                      },
                    ),
                    Text("min")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<SearchType>(
                      groupValue: _searchType,
                      value: SearchType.youn,
                      onChanged: (var val) {
                        setState(() {
                          _searchType = val;
                        });
                      },
                    ),
                    Text("youn")
                  ],
                ),
                //                                                Slider 위젯
                Slider(
                  label: _double_val.toInt().toString(),
                  onChanged: (var val) {
                    setState(() {
                      _double_val = val;
                    });
                  },
                  min: 0,
                  max: 100,
                  divisions: 100,
                  value: _double_val,
                ),
                Text(
                  _double_val.toInt().toString(),
                ),
                //                                      드롭타운(열거형 선택)
                DropdownButton<SearchType>(
                  onChanged: (var val) {
                    setState(() {
                      _searchType = val;
                    });
                  },
                  value: _searchType,
                  items: <DropdownMenuItem<SearchType>>[
                    DropdownMenuItem<SearchType>(
                      child: Text('seung'),
                      value: SearchType.seung,
                    ),
                    DropdownMenuItem<SearchType>(
                      child: Text('min'),
                      value: SearchType.min,
                    ),
                    DropdownMenuItem<SearchType>(
                      child: Text('youn'),
                      value: SearchType.youn,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
