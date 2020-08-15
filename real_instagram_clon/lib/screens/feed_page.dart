import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/insta_text_logo.png',
          height: 26.0,
        ),
        leading: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage("assets/actionbar_camera.png"),
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage("assets/direct_message.png"),
                color: Colors.black,
              )),
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return _feedItem(index);
          }),
    );
  }

  Column _feedItem(int index) {
    return Column(
      children: [_feedImage(index)],
    );
  }

  CachedNetworkImage _feedImage(int index) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/200',
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
