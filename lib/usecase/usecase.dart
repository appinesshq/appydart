import 'package:appydart/appydart.dart';
export 'package:appydart/appydart.dart';

abstract class Usecase<T, A> {
  Future<Result<T>> run(A args);
}
