import 'package:appydart/appydart.dart';
import 'package:test/test.dart';

void main() {
  group('Either', () {
    test('Left', () {
      final res = Either<String, String>.left('Some text');

      expect(res.isLeft(), true);
      expect(res.isRight(), false);
      expect(res.left, 'Some text');
      expect(res.value, 'Some text');
      expect(res.toString(), 'left: Some text');
    });

    test('Right', () {
      final res = Either<String, String>.right('Some text');

      expect(res.isLeft(), false);
      expect(res.isRight(), true);
      expect(res.right, 'Some text');
      expect(res.value, 'Some text');
      expect(res.toString(), 'right: Some text');
    });

    test('None', () {
      final res = Option<String>.none();

      expect(res.isNone(), true);
      expect(res.isState(OptionState.none), true);
      expect(res.isSome(), false);
      expect(res.isState(OptionState.some), false);
      expect(res.toString(), 'none');
    });
  });
}
