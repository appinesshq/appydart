import 'package:appydart/appydart.dart';
import 'package:test/test.dart';

void main() {
  group('Results', () {
    test('Ok result', () {
      final res = Result<String>.ok('Perfect!');

      expect(res.isError(), false);
      expect(res.isOk(), true);
      expect(res.value, 'Perfect!');
      expect(res.toString(), 'value: Perfect!');
      expect(res.isOkAnd((v) => v == 'Perfect!'), true);
    });

    test('Ok BaseResult', () {
      final res = BaseResult<String, String>.ok('Perfect!');

      expect(res.isError(), false);
      expect(res.isOk(), true);
      expect(res.value, 'Perfect!');
      expect(res.toString(), 'value: Perfect!');
      expect(res.isOkAnd((v) => v == 'Perfect!'), true);
    });

    test('Error result', () {
      final res = Result<String>.error(Error('something went wrong'));

      expect(res.isError(), true);
      expect(res.isOk(), false);
      expect(res.error.error(), 'something went wrong');
      expect(isError(res.error), true);
      // TODO: Error toString issue.
      // expect(res.toString(), 'error: something went wrong');
      expect(res.isErrorAnd((v) => isError(v)), true);
    });

    test('Error BaseResult', () {
      final res = BaseResult<String, String>.error('something went wrong');

      expect(res.isError(), true);
      expect(res.isOk(), false);
      expect(res.error, 'something went wrong');
      expect(isError(res.error), false);
      expect(res.toString(), 'error: something went wrong');
      expect(res.isErrorAnd((v) => v == 'something went wrong'), true);
    });
  });
}
