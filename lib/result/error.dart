import 'package:meta/meta.dart';
import 'dart:core';

/// BaseError defines the Error interface, which can be used
/// to implement custom error types.
@immutable
abstract class BaseError {
  const BaseError();

  String error();

  @override
  String toString() => 'error: ${error()}';
}

/// Error is the standard error class using a string as
/// the underlaying type.
@immutable
class Error implements BaseError {
  final String _err;

  const Error(this._err);

  @override
  String error() => _err;
}

/// isErrorType returns true if v is of error type T.
@Deprecated('use "err is Errortype" instead.')
bool isErrorType<T extends BaseError>(dynamic v) {
  // TODO: Check why "if(v is T) return true;" doesn't always work.
  try {
    v as T;
    return true;
  } catch (_) {
    return false;
  }
}

/// isError returns true is v is a type of error.
///
/// Any object implementing the BaseError interface
/// is considered to be an error.
@Deprecated('use "err is BaseError" instead.')
bool isError(dynamic v) => v is BaseError;
