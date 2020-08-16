import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:real_instagram_clon/utils/profile_img_path.dart';
import 'package:real_instagram_clon/utils/size.dart';
import 'dart:ui';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpend = false;
  Size _size;
  double menuWidth;
  int duration = 200;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    menuWidth = _size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: [_sideMenu(), _profile()],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      color: Colors.grey[200],
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
        _menuOpend ? _size.width - menuWidth : _size.width,
        0,
        0,
      ),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: common_gap, vertical: common_gap),
                child: FlatButton(
                  child: Text('dwd'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.transparent,
      duration: Duration(
        milliseconds: duration,
      ),
      transform: Matrix4.translationValues(
        _menuOpend ? -menuWidth : 0,
        0,
        0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            _usernameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _getProfileHeader,
                      Padding(
                        padding: const EdgeInsets.only(left: common_gap),
                        child: Text('username',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: common_gap),
                        child: Text('dwdlefkefsldfoiefkdmpfiekfa ',
                            style: TextStyle(fontWeight: FontWeight.w200)),
                      ),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row get _getProfileHeader => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(common_xs_gap),
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage:
                  CachedNetworkImageProvider(getProfileImagPath("username")),
            ),
          ),
          Expanded(
            child: Table(
              children: [
                TableRow(children: [
                  _getStatusValueWidget('1'),
                  _getStatusValueWidget('2'),
                  _getStatusValueWidget('3'),
                ]),
                TableRow(children: [
                  _getStatusLabelWidget('Posts'),
                  _getStatusLabelWidget('Followers'),
                  _getStatusLabelWidget('Following'),
                ])
              ],
            ),
          )
        ],
      );
  Widget _getStatusValueWidget(String val) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(val,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      );
  Widget _getStatusLabelWidget(String val) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(val,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400)),
          ),
        ),
      );

  Row _usernameIconButton() {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Text(
            's_omn._',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )),
        IconButton(
          onPressed: () {
            setState(() {
              _menuOpend = !_menuOpend;
            });
          },
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
