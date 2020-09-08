import 'package:flutter/foundation.dart';

import '../user.dart';

class MyUserData extends ChangeNotifier {
  User _myUserData;
  User get data => _myUserData;
  void setUserData(User user) {
    _myUserData = user;
    notifyListeners();
  }

  void clearUser() {
    _myUserData = null;
  }
}
