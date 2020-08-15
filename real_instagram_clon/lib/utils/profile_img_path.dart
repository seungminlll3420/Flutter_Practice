import 'dart:convert';

String getProfileImagPath(String username) {
  final encoder = AsciiEncoder();
  List<int> codes = encoder.convert(username);

  int sum = 0;
  codes.forEach((code) => sum += code);
  final imgNum = sum % 1000;

  return 'https://picsum.photos/id/$imgNum/50/50';
}
