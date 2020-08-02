void main() {
  // 작은 따옴표와 큰 따옴표 둘다 사용가능. 문법상 차이가 없고, 문서에서는 주로 작은 따옴표를 사용한다
  //  print('Hello, World');
  //  print("Hello, World");

  //  Dart에서는 타입을 추론하다. 그때 var을 사용하여 편하게 사용할 수 있다.
  var a1 = 10;
  var a2 = "Hello, World";

  // dynamic는 var과 같이 타입을 추론한다. var과 차이점은 dynamic은 주로 함수에서 파라미터의 타입으로 사용된다.

  dynamic b1 = 20;
  myprint(10);
  myprint('Hello, World');
  myprint(2.5);

  // num은 int와 double을 모두 포함한 변수타입이다. num의 장점은 타입 캐스팅을 할때 나타난다.
  // Dart에서 타입 캐스팅을 할때 반드시 표현을 해줘야하지만 num은 그럴 필요가 없다.
  int c1 = 5;
  double c2 = 10.5;
  //c1 = c2 as int;
  //c2 = c1 as double;
  num c3 = 10;
  num c4 = 10.5;
  c3 = c4;
  c4 = c3;

  // final은 한번 초기화하면 변경할 수 없는 값이다. 변수의 타입을 표시하지 않아도 사용할 수 있다.
  final d1 = 10;
  final int d2 = 20;

  // const는 final과 같은 특징을 가진다. 차이점을 컴파일 타임에 미리 메모리가 할당된다.
  const e1 = 10;
  const int e2 = 10;

  // 리스트이다. 이 타입 역시 var을 통해 간편하게 사용할 수 있다. 리스트 접근은 배열을 접근하는 방법과 같다.
  // Dart는 배열이 없다...
  List<String> f1 = ['a', 'b', 'c'];
  List<int> f2 = [1, 2, 3];
  var f3 = ['a', 'b', 'c'];
  var f4 = [1, 2, 3];
  print(f3[0]);
  print(f3[1]);
  print(f3[2]);

  // set
  Set<int> g1 = {1, 2, 3};
  // map
  Map h = {
    'key1': 1,
    'key2': 2,
    'key3': 3,
  };
  // ... 문법
  var i1 = [1, 2, 3];
  var i2 = [...i1, 4, 5]; // print -> [1,2,3,4,5]

  // function
  // j1. 옵션기능 함수의 파라미터를 {}로 감싸면 아래와 같이 : 연산자를 통해 지정할 수 있다.
  // j1. 옵션은 지정하지 않아도 된다. 옵션처리하지 않은 필수 파라미터는 지정을 해줘야한다.
  // j2. 디폴트 값을 넣어 줄수 있다. {int age = 10}
  // j3. 옵션을 사용하도록 경고를 하도록 만들수도 있다. @required 를 사용하면 된다. 이때 디폴트 값은 지정하면 안된다.
  // j4. Dart는 함수를 파라미터로 전달할 수 있다.
  j1('Hello, world', age: 3);

  j2('Hello, world');
  j3('Hello, world', age: 10);

  // 타입 비교
  // is를 사용한다, is! 하면 is not 이다.
  var k1 = 10;
  if (k1 is int) {
    print("정수");
  } else if (k1 is! double) {
    print("안정수");
  }
  // ?? 문법
  // 변수가 null일 경우 변수를 다른 값으로 지정할 수 있다.
  // . 연산자 앞에 ?를 사용하면 null이 아닌경우에만 실해됨.
  var name;
  print(name ?? '널');
  String name2;
  print(name2?.toLowerCase()); // ?이 없으면 런타임 오류
  print(name2?.toLowerCase() ?? '널');
  // class
  // Person new 키워드 생략 가능. 생성자를 간편하게 작성할 수 있다.
  // Person2 변수앞에 _ 붙이면 프라이빗 속성이 붙는다.
  // 상속은 extends로 할수있다. 하지만 기능만(인터페이스만) 가지고 오고 싶다면 implemant하여 모두 override하면된다.
  // implemant할때 선택적으로 override 할수있다. 이때는 with 하면된다.

  Person person = Person();
  Person2 person2 = Person2();

  // Futrue 비동기를 위해 사용된다.
  print('시작');
  networkRequest();
  print('끝');
}

Future networkRequest() async {
  print('네트워크 요청 시작');
  await Future.delayed(Duration(seconds: 1));
  print('1');
  await Future.delayed(Duration(seconds: 1));
  print('2');
  await Future.delayed(Duration(seconds: 1));
  print('3');
  await Future.delayed(Duration(seconds: 1));
  print('네트워크 요청 끝');
}

/// dwdwdwd
class Person {
  String name;
  int age;
  Person({this.name, this.age});
}

class Person2 {
  String _name;
  int _age;

  //String get name => _name;
  //String get name => '제 이름은 $_name';
  String get name {
    return '제 이름은 $_name';
  }
}

void myprint(dynamic a) {
  return;
}

void j1(var name, {var age}) {}
void j2(var name, {var age = 10}) {}
void j3(var name, {var age}) {}

void j4(Function(int i) f) {
  f(10);
}
