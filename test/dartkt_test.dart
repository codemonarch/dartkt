import 'package:test/test.dart';
import 'package:dartkt/dartkt.dart';

void main() {
  test('KTExtension', () {
    Config.loadFromPath('sample.cfg');
    Config.set('x', 'xvalue');
    Config.saveToPath('sample2.cfg');
  });
}
