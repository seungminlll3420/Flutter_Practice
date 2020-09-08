import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_instagram_clon/constants/firebase_keys.dart';

class User {
  final String userKey;
  final String profileImg;
  final String username;
  final String email;
  final int follwers;
  final List<dynamic> follwings;
  final List<dynamic> likePosts;
  final List<dynamic> myPosts;
  final DocumentReference reference;

  User.fromMap(Map<String, dynamic> map, this.userKey, {this.reference})
      : profileImg = map[KEY_PROFILEIMG],
        username = map[KEY_USERNAME],
        email = map[KEY_EMAIL],
        likePosts = map[KEY_LIkEDPOSTS],
        follwers = map[KEY_FOLLOWERS],
        follwings = map[KEY_FOLLOWINGS],
        myPosts = map[KEY_MYPOSTS];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.documentID,
            reference: snapshot.reference);

  static Map<String, dynamic> getMapForCreateUser(String email) {
    Map<String, dynamic> map = Map();
    map[KEY_PROFILEIMG] = "";
    map[KEY_USERNAME] = email.split('@')[0];
    map[KEY_EMAIL] = email;
    map[KEY_LIkEDPOSTS] = [];
    map[KEY_FOLLOWERS] = 0;
    map[KEY_FOLLOWINGS] = [];
    map[KEY_MYPOSTS] = [];
    return map;
  }
}
