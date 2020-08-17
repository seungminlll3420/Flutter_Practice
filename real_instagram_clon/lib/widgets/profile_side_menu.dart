import 'package:flutter/material.dart';
import 'package:real_instagram_clon/screens/auth_page.dart';

import 'package:real_instagram_clon/utils/size.dart';

class profileSideMenu extends StatelessWidget {
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
                final roote =
                    MaterialPageRoute(builder: (context) => AuthPage());
                Navigator.pushReplacement(context, roote);
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
