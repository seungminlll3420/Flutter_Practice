import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:real_instagram_clon/utils/profile_img_path.dart';
import 'package:real_instagram_clon/utils/size.dart';
import 'package:real_instagram_clon/widgets/comment.dart';

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
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return _postItem(index, context);
          }),
    );
  }

  Column _postItem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader('username $index'),
        _postImage(index),
        _postActions(),
        _postLikes(),
        _postCaption(context, index),
        _allComments()
      ],
    );
  }

  FlatButton _allComments() {
    return FlatButton(
        onPressed: () {},
        child: Text(
          'Show all comment 18!',
          style: TextStyle(color: Colors.grey[600]),
        ));
  }

  Padding _postCaption(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xs_gap),
      child: Comment(
        username: 'username $index',
        caption: '배불렁~~~~~~!',
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '80 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: [
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/bookmark.png'),
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/comment.png'),
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/direct_message.png'),
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        Spacer(),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/heart_selected.png'),
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Row _postHeader(String username) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_gap),
          child: CircleAvatar(
            backgroundImage:
                CachedNetworkImageProvider(getProfileImagPath(username)),
            radius: profile_radius,
          ),
        ),
        //Expanded : 남은 공간 차지~~
        Expanded(child: Text(username)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          color: Colors.black87,
        )
      ],
    );
  }

  CachedNetworkImage _postImage(int index) {
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
