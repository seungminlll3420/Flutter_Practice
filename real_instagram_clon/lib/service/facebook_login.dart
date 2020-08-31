import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:real_instagram_clon/utils/simple_Snackbar.dart';

void signInFacebook(BuildContext context) async {
  final facebookLogin = FacebookLogin();
  final result = await facebookLogin.logIn(['email']);
  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      handleFacebookToken(context, result.accessToken.token);
      break;
    case FacebookLoginStatus.cancelledByUser:
      simpleSnackbar(context, 'User cancell Facebook sign in!!');
      break;
    case FacebookLoginStatus.error:
      simpleSnackbar(context, 'Error while Facebook sign in!!');
      break;
  }
}

void handleFacebookToken(BuildContext context, String token) async {
  final AuthCredential credential = FacebookAuthProvider.getCredential(
    accessToken: token,
  );
  final FirebaseUser user =
      (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  if (user == null) {
    simpleSnackbar(context, 'Failed to Sign in with Facebook');
  }
}
