import 'dart:math';

Set<int> lottoNumber() {
  var random = Random();

  Set<int> lottoSet = {};

  while (lottoSet.length != 6) {
    lottoSet.add(random.nextInt(45) + 1);
  }

  print('당첨번호');
  print(lottoSet);

  return lottoSet;
}

Set<int> myNumber() {
  var random = Random();

  Set<int> mySet = {};

  while (mySet.length != 6) {
    mySet.add(random.nextInt(45) + 1);
  }

  print('내 추천번호');
  print(mySet);

  return mySet;
}

void checkNumber(lottoSet, mySet) {
  int x = 0;
  for (int lotto in lottoSet) {
    for (int myNum in mySet) {
      if (lotto == myNum) {
        x++;
      }
      // print('로또번호 = $lotto');
      // print('내 추첨번호 = $myNum');
    }
  }
  print('당첨된 번호 개수 : $x');
}

void main() {
  Set<int> lottoFinal = lottoNumber();
  Set<int> myFinal = myNumber();
  checkNumber(lottoFinal, myFinal);
}
