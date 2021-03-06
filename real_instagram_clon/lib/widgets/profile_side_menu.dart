import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_instagram_clon/constants/size.dart';
import 'package:real_instagram_clon/data/provider/my_user_data.dart';

class ProfileSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.grey[300]))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: Text(
              'Setting',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          FlatButton.icon(
              onPressed: () {
                Provider.of<MyUserData>(context, listen: false).clearUser();
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'Log out',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
