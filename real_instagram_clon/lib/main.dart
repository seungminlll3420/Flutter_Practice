import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_instagram_clon/main_page.dart';

import 'package:real_instagram_clon/screens/auth_page.dart';
import 'package:real_instagram_clon/utils/constants.dart';
import 'package:real_instagram_clon/widgets/my_progress_Indicator.dart';

void main() {
  runApp(MyApp());
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
            print(isitFirstData);
            if (isitFirstData) {
              isitFirstData = false;
              return MyProgressIndicator();
            } else {
              if (snapshot.hasData)
                return MainPage();
              else
                return AuthPage();
            }
          }),
    );
  }
}
