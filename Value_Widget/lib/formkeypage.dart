import 'package:flutter/material.dart';

class FormKeyPage extends StatefulWidget {
  @override
  _FormKeyPageState createState() => _FormKeyPageState();
}

class _FormKeyPageState extends State<FormKeyPage> {
  var _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          children: <Widget>[
            Form(
              key: _key,
              autovalidate: true,
              child: Container(
                child: TextFormField(
                  validator: (var val) {
                    if (val.isEmpty) return '뭐라도 써봐;;';
                    return null;
                  },
                ),
              ),
            ),
            RaisedButton(onPressed: () {
              if (_key.currentState.validate())
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));

              child:
              Text('Submit');
            })
          ],
        ));
  }
}
