import 'package:appydart/appydart.dart';
import 'package:test/test.dart';

class CustomError extends BaseError {
  @override
  String error() => 'this is a custom error!';
}

void main() {
  group('Errors', () {
    final err = Error("this is an error");
    final customError = CustomError();

    setUp(() {
      // Additional setup goes here.
    });

    test('Error produces string', () {
      expect(err.error(), "this is an error");
      // TODO: Check why this fails on Error, but not on CustomError.
      // expect(err.toString(), "error: this is an error");
    });

    // test('Error is Error', () {
    //   expect(isError(err), true);
    //   expect(isErrorType<Error>(err), true);
    //   expect(isErrorType<BaseError>(err), true);
    // });

    test('CustomError produces string', () {
      expect(customError.error(), "this is a custom error!");
      expect(customError.toString(), "error: this is a custom error!");
    });

    // test('CustomError is not Error, but CustomError and BaseError', () {
    //   expect(isError(customError), true);
    //   expect(isErrorType<CustomError>(customError), true);
    //   expect(isErrorType<Error>(customError), false);
    //   expect(isErrorType<BaseError>(customError), true);
    // });
  });
}
