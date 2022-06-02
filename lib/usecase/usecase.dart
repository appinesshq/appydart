import 'package:appydart/result/result.dart';

abstract class BaseUsecase<T, A> {
  Future<T> run(A args);
}

abstract class Usecase<T, A> extends BaseUsecase<Result<T>, A> {
  @override
  Future<Result<T>> run(A args);
}
