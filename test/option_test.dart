import 'package:appydart/appydart.dart';
import 'package:test/test.dart';

void main() {
  group('Options', () {
    test('Some', () {
      final res = Option<String>.some('Some text');

      expect(res.isNone(), false);
      expect(res.isState(OptionState.none), false);
      expect(res.isSome(), true);
      expect(res.isState(OptionState.some), true);
      expect(res.value, 'Some text');
      expect(res.toString(), 'some: Some text');
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
