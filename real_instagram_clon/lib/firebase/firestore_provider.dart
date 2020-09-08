import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_instagram_clon/constants/firebase_keys.dart';
import 'package:real_instagram_clon/data/user.dart';
import 'package:real_instagram_clon/firebase/transformer.dart';

FirestoreProvider firestoreProvider = FirestoreProvider();

class FirestoreProvider with TransFormer {
  Firestore _firestore = Firestore.instance;

  Future<void> attemptCreateUser({String userKey, String email}) async {
    final DocumentReference userRef =
        _firestore.collection(COLLECTION_USERS).document(userKey);
    final DocumentSnapshot snapshot = await userRef.get();
    return _firestore.runTransaction((Transaction tx) async {
      if (!snapshot.exists) {
        await tx.set(userRef, User.getMapForCreateUser(email));
      }
    });
  }

  Stream<User> connectMyUserData(String userKey) {
    return _firestore
        .collection(COLLECTION_USERS)
        .document(userKey)
        .snapshots()
        .transform(toUser);
  }

  Stream<List<User>> fetcAllUsers() {
    return _firestore
        .collection(COLLECTION_USERS)
        .snapshots()
        .transform(toUsers);
  }

  Stream<List<User>> fetcAllUsersExceptMine() {
    return _firestore
        .collection(COLLECTION_USERS)
        .snapshots()
        .transform(toUsersExceptMine);
  }
}
//   Future<void> sendData() {
//     return Firestore.instance
//         .collection('Users')
//         .document('123123123')
//         .setData({'email': 'seungmin3420@naver.com', 'name': 'seungmin'});
//   }

//   Stream<dynamic> getData() {
//     Firestore.instance
//         .collection('Users')
//         .document('123123123')
//         .get()
//         .then((DocumentSnapshot ds) {
//       print(ds.data);
//     });
//   }
// }
