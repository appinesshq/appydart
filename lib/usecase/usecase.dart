import 'package:appydart/appydart.dart';
export 'package:appydart/appydart.dart';

abstract class Usecase<T, E extends BaseError, A> {
  Future<Result<T, E>> run(A args);
}
