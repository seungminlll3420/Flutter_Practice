import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_instagram_clon/data/provider/my_user_data.dart';
import 'package:real_instagram_clon/firebase/firestore_provider.dart';
import 'package:real_instagram_clon/main_page.dart';
import 'package:real_instagram_clon/screens/auth_page.dart';
import 'package:real_instagram_clon/constants/constants.dart';
import 'package:real_instagram_clon/widgets/my_progress_Indicator.dart';

void main() {
  // ignore: missing_required_param
  runApp(ChangeNotifierProvider<MyUserData>(
      // ignore: deprecated_member_use
      builder: (context) => MyUserData(),
      child: MyApp()));
}

bool isitFirstData = true;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: white),
      home: StreamBuilder<FirebaseUser>(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, snapshot) {
            if (isitFirstData) {
              isitFirstData = false;
              return MyProgressIndicator();
            } else {
              if (snapshot.hasData) {
                firestoreProvider.attemptCreateUser(
                    userKey: snapshot.data.uid, email: snapshot.data.email);
                var myUserData = Provider.of<MyUserData>(context);
                firestoreProvider
                    .connectMyUserData(snapshot.data.uid)
                    .listen((user) {
                  myUserData.setUserData(user);
                });
                return MainPage();
              } else
                return AuthPage();
            }
          }),
    );
  }
}
