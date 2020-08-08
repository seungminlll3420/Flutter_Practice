import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Dice game app'),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Image.asset('images/moomin.png'),
              SizedBox(
                height: 70.0,
              ),
              Text(
                '주사위 개수를 선택해주세요!',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 100.0,
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/die');
                        },
                        child: Text('주사위 1개'),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    ButtonTheme(
                      minWidth: 100.0,
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/dice');
                        },
                        child: Text('주사위 2개'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
