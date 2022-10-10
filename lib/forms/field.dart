import 'package:appydart/result/result.dart';
import 'package:meta/meta.dart';

@immutable
abstract class Field<T, E extends BaseError> {
  final T? value;
  final bool dirty;

  const Field({T? initialValue})
      : value = initialValue,
        dirty = false;
  const Field.dirty({this.value}) : dirty = true;

  Result<T> validate(T? value);

  bool get isValid => validate(value).isOk();
  E? get error {
    final res = validate(value);
    return res.isError() ? res.error as E : null;
  }

  E? get getError => dirty ? error : null;
  String? get getErrorString => dirty && error != null ? error?.error() : null;

  @override
  int get hashCode => Object.hashAll([value, dirty]);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is Field<T, E> && other.value == value && other.dirty == dirty;
  }

  @override
  String toString() {
    return dirty
        ? '''Field<$T, $E>.dirty(value: $value, isValid: $isValid, error: $error)'''
        : '''Field<$T, $E>(value: $value, isValid: $isValid, error: $error)''';
  }
}
