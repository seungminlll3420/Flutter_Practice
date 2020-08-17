import 'package:flutter/material.dart';

import 'package:real_instagram_clon/widgets/sign_in_form.dart';

import 'package:real_instagram_clon/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Widget currentWidget = SignInForm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  child: child,
                  scale: animation,
                );
              },
              duration: Duration(milliseconds: 400),
              child: currentWidget,
            ),
            _goToSigniUpPageBtn(context)
          ],
        )));
  }

  Positioned _goToSigniUpPageBtn(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
        onPressed: () {
          setState(() {
            if (currentWidget is SignInForm) {
              currentWidget = SignUpForm();
            } else {
              currentWidget = SignInForm();
            }
          });
        },
        shape: Border(top: BorderSide(color: Colors.grey[300])),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: currentWidget is SignInForm
                      ? "Don't have an account?"
                      : "Already have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black54)),
              TextSpan(
                  text:
                      currentWidget is SignInForm ? "   Sign Up" : "   Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[600])),
            ],
          ),
        ),
      ),
    );
  }
}
