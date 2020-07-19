import 'package:flutter/material.dart';

class AlignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 각 축의 Widget 거리를 조절한다..
        // Row에서는 왼쪽, 오른쪽 (X축)거리를 조절
        // Colimn에서는 위, 아래 (Y축)거리를 조절
        crossAxisAlignment: CrossAxisAlignment.center,
        // 각 교차축의 Widget 거리를 조절한다..
        // Row에서는 위, 아래 (Y축)거리를 조절
        // Colimn에서는 왼쪽, 오른쪽 (X축)거리를 조절
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.access_alarms),
              Text('알람 1'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.access_alarms),
              Text('알람 2'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.access_alarms),
              Text('알람 3'),
            ],
          ),
          Text('안녕하세요 ?')
        ],
      ),
    );
  }
}
