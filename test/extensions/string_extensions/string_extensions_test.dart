import 'package:appydart/extensions/string_extensions/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('string extensions', () {
    test('capitalize first', () {
      expect('this is a test'.capitalizeFirst(), 'This is a test');
    });

    test('capitalize all', () {
      expect(
          'this is, again, a test.'.capitalizeAll(), 'This Is, Again, A Test.');
    });
  });
}
