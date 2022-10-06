import 'package:appydart/result/result.dart';
import 'package:appydart/usecase/usecase.dart';

class TestError extends BaseError {
  @override
  String error() {
    return 'this is a test error';
  }
}

class TestUsecase extends Usecase<String, Args> {
  @override
  Future<Result<String>> run(Args args) async {
    return Result.error(TestError());
  }
}

class Args {}

void main() async {
  final res = await TestUsecase().run(Args());

  if (res.error is TestError) {
    print('received TestError');
  }
}
