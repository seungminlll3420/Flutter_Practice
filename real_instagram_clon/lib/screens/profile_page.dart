import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:real_instagram_clon/data/provider/my_user_data.dart';
import 'package:real_instagram_clon/data/user.dart';
import 'package:real_instagram_clon/utils/profile_img_path.dart';
import 'package:real_instagram_clon/constants/size.dart';
import 'dart:ui';

import 'package:real_instagram_clon/widgets/profile_side_menu.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _menuOpend = false;
  double menuWidth;
  int duration = 300;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  bool _tabIconGridSelected = true;
  double _gridMargin = 0;
  double _myImgGridMargin = size.width;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));
    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    menuWidth = size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: [
          _profile(),
          _sideMenu(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      color: Colors.grey[100],
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
        _menuOpend ? size.width - menuWidth : size.width,
        0,
        0,
      ),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: ProfileSideMenu(),
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
                      _username(),
                      _userBio(),
                      _editProfileButton(),
                      _getTapIconButtons,
                      _getAnimatedSelectedbar,
                    ]),
                  ),
                  _getImageGrid(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
            _menuOpend
                ? _animationController.reverse()
                : _animationController.forward();
            setState(() {
              _menuOpend = !_menuOpend;
            });
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
            semanticLabel: "Show menu",
          ),
        )
      ],
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
  Padding _username() {
    return Padding(
        padding: const EdgeInsets.only(left: common_gap),
        child: Consumer<MyUserData>(builder: (context, myUserData, child) {
          return Text(myUserData.data.username,
              style: TextStyle(fontWeight: FontWeight.bold));
        }));
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text('히히', style: TextStyle(fontWeight: FontWeight.w200)),
    );
  }

  Padding _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: SizedBox(
        height: 24.0,
        child: OutlineButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          borderSide: BorderSide(color: Colors.black45),
          onPressed: () {},
          child: Text('Edit profile',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getImageGrid(BuildContext context) => SliverToBoxAdapter(
        child: Stack(
          children: [
            AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: duration),
                transform: Matrix4.translationValues(_gridMargin, 0, 0),
                child: _imageGrid),
            AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: duration),
                transform: Matrix4.translationValues(_myImgGridMargin, 0, 0),
                child: _imageGrid),
          ],
        ),
      );
  Widget get _getAnimatedSelectedbar => AnimatedContainer(
        color: Colors.transparent,
        curve: Curves.easeInOut,
        alignment: tabAlign,
        height: 2,
        width: size.width,
        duration: Duration(
          milliseconds: duration,
        ),
        child: Container(
          height: 2,
          width: size.width / 2,
          color: Colors.black87,
        ),
      );

  GridView get _imageGrid => GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: List.generate(4, (index) => _gridImgItem(index)),
      );

  CachedNetworkImage _gridImgItem(int index) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: 'https://picsum.photos/id/$index/100/100',
      );

  _setTap(bool val) {
    setState(() {
      if (val) {
        this.tabAlign = Alignment.centerLeft;
        this._tabIconGridSelected = true;
        _gridMargin = 0;
        _myImgGridMargin = size.width;
      } else {
        this.tabAlign = Alignment.centerRight;
        this._tabIconGridSelected = false;
        _gridMargin = -size.width;
        _myImgGridMargin = 0;
      }
    });
  }

  Widget get _getTapIconButtons => Row(
        children: [
          Expanded(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _setTap(true);
                    });
                  },
                  color: _tabIconGridSelected ? Colors.black : Colors.grey,
                  icon: ImageIcon(AssetImage('assets/grid.png')))),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _setTap(false);
                    });
                  },
                  color: _tabIconGridSelected ? Colors.grey : Colors.black,
                  icon: ImageIcon(AssetImage('assets/saved.png')))),
        ],
      );
}
