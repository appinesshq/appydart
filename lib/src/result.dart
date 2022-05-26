import 'error.dart';

enum ResultState { ok, error }

/// BaseResult holds a value of type T or an error of type E.
///
/// BaseResult is used to return a result that's either ok or
/// an error.
class BaseResult<T, E> {
  ResultState state;
  T? _value;
  E? _error;

  /// BaseResult.ok is the constructor for an ok result.
  BaseResult.ok(this._value) : state = ResultState.ok;

  /// BaseResult.error is the constructor for an error result.
  BaseResult.error(this._error) : state = ResultState.error;

  /// value is a getter that returns the value.
  ///
  /// Throws if there is no value.
  T get value => _value!;

  /// error is a getter that returns the error.
  ///
  /// Throws if there is no error.
  E get error => _error!;

  /// isOk returns true if Results represents an ok result.
  bool isOk() => _value != null;

  /// isError returns true if Results represents an error.
  bool isError() => _error != null;

  /// isOkAnd returns true if Results represents an ok result and the
  /// additional code of f returns true.
  bool isOkAnd(bool Function(T) f) => isOk() ? f(_value as T) : false;

  /// isErrorAnd returns true if Results represents an error and the
  /// additional code of f returns true.
  bool isErrorAnd(bool Function(E) f) => isError() ? f(_error as E) : false;

  String _toErrorString() {
    if (!isError()) return '';
    if (error is Error) {
      final e = error as BaseError;
      return e.toString();
    }

    return 'error: ${error.toString()}';
  }

  @override
  String toString() =>
      isError() ? _toErrorString() : 'value: ${_value.toString()}';
}

// Result is an implementation of BaseResult that uses
// the Error class for errors.
class Result<T> extends BaseResult<T, BaseError> {
  Result.ok(T value) : super.ok(value);
  Result.error(BaseError error) : super.error(error);
}
