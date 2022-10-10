import 'package:appydart/extensions/if_not_null_return/if_not_null_return.dart';
import 'package:test/test.dart';

void main() {
  group('if_not_null_return extension', () {
    test('left is null', () {
      String? str;
      expect(str.ifNotNullReturn('right'), null);
    });

    test('left is not null', () {
      String? str = 'left';
      expect(str.ifNotNullReturn('right'), 'right');
    });
  });
}
