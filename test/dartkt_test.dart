import 'package:dartkt/dartkt.dart';
import 'package:dartkt/src/file_extension.dart';
import 'package:test/test.dart';
import 'package:dartkt/src/object_extension.dart';
import 'package:dartkt/src/string_extension.dart';
import 'package:dartkt/src/regex_extension.dart';

void main() {
  test('Object Extension', () {
    var e = 'rarnu1985@gmail.com';
    var e1 = 'string';
    var r = RegexUtil.isEmail(e);
    var r1 = RegexUtil.isEmail(e1);
    print('0: $r, 1: $r1');
  });
}
