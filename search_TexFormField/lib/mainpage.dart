import 'package:flutter/material.dart';

enum SearchType { web, image, news, sjopping }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _val_bool = false;
  String _val_string = "";
  var _key = GlobalKey<FormState>();
  var _searchType = SearchType.web;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                autovalidate: true,
                key: _key,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DropdownButton<SearchType>(
                        onChanged: (SearchType _searchType_val) {
                          setState(() {
                            _searchType = _searchType_val;
                          });
                        },
                        value: _searchType,
                        items: <DropdownMenuItem<SearchType>>[
                          DropdownMenuItem<SearchType>(
                            child: Text('web'),
                            value: SearchType.web,
                          ),
                          DropdownMenuItem<SearchType>(
                            child: Text('image'),
                            value: SearchType.image,
                          ),
                          DropdownMenuItem<SearchType>(
                            child: Text('news'),
                            value: SearchType.news,
                          ),
                          DropdownMenuItem<SearchType>(
                            child: Text('sjopping'),
                            value: SearchType.sjopping,
                          ),
                        ],
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _val_string = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: '마 써봐라!',
                            labelText:
                                _searchType.toString() + "에 대한 내용을 검색해 주세요~~!"),
                        validator: (String value) {
                          if (value.isEmpty) return '뭐하도 입력해봐';
                          return null;
                        },
                      ),
                      if (_val_string.isNotEmpty)
                        Text(
                          "입력내용 : " + _val_string,
                          textAlign: TextAlign.start,
                        ),
                      FormField<bool>(builder: (FormFieldState<bool> state) {
                        return Row(
                          children: <Widget>[
                            Text("안전 검색"),
                            Checkbox(
                              value: _val_bool,
                              onChanged: (value) {
                                setState(() => _val_bool = value);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 170),
                            ),
                            Container(
                              child: RaisedButton(
                                color: Colors.blue,
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_key.currentState.validate()) {
                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          // Retrieve the text the that user has entered by using the
                                          // TextEditingController.
                                          content: Text(_val_string),
                                          backgroundColor: Colors.white,
                                        );
                                      },
                                    );
                                  }
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          // Retrieve the text the that user has entered by using the
                                          // TextEditingController.
                                          content: Text("아무것도 없는디...."));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
