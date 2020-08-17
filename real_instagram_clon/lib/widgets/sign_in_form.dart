import 'package:flutter/material.dart';
import 'package:real_instagram_clon/main_page.dart';
import 'package:real_instagram_clon/utils/simple_Snackbar.dart';
import 'package:real_instagram_clon/utils/size.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  var _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _pwController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            // mainAxisSize: MainAxisSize.max,
            padding: EdgeInsets.only(top: 100),
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 6,
              ),
              Image.asset('assets/insta_text_logo.png'),
              SizedBox(
                height: 1,
              ),
              TextFormField(
                controller: _emailController,
                decoration: _getTextFieldDecor('Email'),
                validator: (String value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return "Please enter your email address!";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 1,
              ),
              TextFormField(
                controller: _pwController,
                decoration: _getTextFieldDecor('Password'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter your Password address!";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                'Forgotten password?',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.blue[700], fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2,
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final roote =
                        MaterialPageRoute(builder: (context) => MainPage());
                    Navigator.pushReplacement(context, roote);
                  }
                },
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              SizedBox(
                height: 2,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    height: 1,
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 30,
                    color: Colors.grey[50],
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              FlatButton.icon(
                onPressed: () {
                  simpleSnackBar(context, 'Test Snackbar!');
                },
                icon: ImageIcon(AssetImage('assets/icon/facebook.png')),
                label: Text('Login with Facebook'),
                textColor: Colors.blue,
              ),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _getTextFieldDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300], width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300], width: 1)),
      fillColor: Colors.grey[100],
      filled: true,
    );
  }
}
