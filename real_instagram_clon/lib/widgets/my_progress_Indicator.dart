import 'package:flutter/material.dart';
import 'package:real_instagram_clon/utils/size.dart';

class MyProgressIndicator extends StatelessWidget {
  final double containerSize;
  final double progressSize;
  const MyProgressIndicator({
    Key key,
    this.containerSize,
    this.progressSize = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      width: containerSize,
      child: Center(
        child: SizedBox(
          height: progressSize,
          width: progressSize,
          child: Image.asset(
            'assets/loading_img.gif',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
