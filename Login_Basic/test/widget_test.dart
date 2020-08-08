import 'dart:io';

void main() {
  showData();
}

void showData() {
  startTask();
  aCCessData();
  fetchData();
}

void startTask() {
  String info1 = '요청 수행 시작';
  print(info1);
}

void aCCessData() {
  Duration time = Duration(seconds: 3);

  if (time.inSeconds > 2) {
    Future.delayed(time, () {
      String info2 = '데이터 처리 완료';
      print(info2);
    });
  } else {
    String info2 = '데이터를 가져왔습니다';
    print(info2);
  }
}

void fetchData() {
  String info3 = '잔액은 8,500만원 입니다';
  print(info3);
}
