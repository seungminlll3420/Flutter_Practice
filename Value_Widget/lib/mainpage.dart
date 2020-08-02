import 'package:flutter/material.dart';

enum SearchType { seung, min, youn }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _controller = TextEditingController();
  var _searchTerm = "";
  var val1 = true;
  SearchType _searchType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              '아래에 입력하세요!',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
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
            Checkbox(
              value: val1,
              onChanged: (var val) {
                setState(() {
                  val1 = val;
                });
              },
            ),
            Switch(
              value: val1,
              onChanged: (var val) {
                setState(() {
                  val1 = val;
                });
              },
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
