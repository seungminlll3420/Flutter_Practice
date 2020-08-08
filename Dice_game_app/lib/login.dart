import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _dice = TextEditingController();
  var _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text('Dice game app'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                Center(
                  child: Image(
                    width: 170.0,
                    height: 190.0,
                    image: AssetImage('images/moomin.png'),
                  ),
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _dice,
                            decoration:
                                InputDecoration(labelText: 'Enter "dice"'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: _password,
                            decoration:
                                InputDecoration(labelText: 'Enter Password'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          ButtonTheme(
                              child: RaisedButton(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            color: Colors.orangeAccent,
                            onPressed: () {
                              if (_dice.text == 'dice' &&
                                  _password.text == '1234') {
                                Navigator.pushNamed(context, '/choice');
                              } else if (_dice.text != 'dice' &&
                                  _password.text == '1234') {
                                show_Dice_Warning_SnackBar(context);
                              } else if (_dice.text == 'dice' &&
                                  _password.text != '1234') {
                                show_password_Warning_SnackBar(context);
                              } else {
                                show_Dice_and_password_Warning_SnackBar(
                                    context);
                              }
                            },
                          ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

// ignore: non_constant_identifier_names
void show_Dice_and_password_Warning_SnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      "로그인 정보를 다시 확인하세요",
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

// ignore: non_constant_identifier_names
void show_Dice_Warning_SnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      " 'Dice' 정보를 다시 확인하세요",
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

// ignore: non_constant_identifier_names
void show_password_Warning_SnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '"password" 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
