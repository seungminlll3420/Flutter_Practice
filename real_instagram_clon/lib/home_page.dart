import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.only(bottom: 7.0),
                child: Image.asset(
                  "assets/direct_message.png",
                  fit: BoxFit.none,
                )),
          ],
          title: Padding(
              child: SizedBox(
                  height: 50,
                  width: 150,
                  child: Image.asset(
                    "assets/insta_text_logo.png",
                  )),
              padding: const EdgeInsets.only(bottom: 7.0)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Image.asset("assets/actionbar_camera.png"),
            onPressed: () {},
            padding: EdgeInsets.only(bottom: 7.0),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 6.0,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                ])),
            Divider(),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
