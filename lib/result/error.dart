/// BaseError defines the Error interface, which can be used
/// to implement custom error types.
abstract class BaseError {
  String error();

  @override
  String toString() => 'error: ${error()}';
}

/// Error is the standard error class using a string as
/// the underlaying type.
class Error implements BaseError {
  final String _err;

  const Error(this._err);

  @override
  String error() => _err;
}

/// isErrorType returns true if v is of error type T.
bool isErrorType<T extends BaseError>(dynamic v) => v is T;

/// isError returns true is v is a type of error.
///
/// Any object implementing the BaseError interface
/// is considered to be an error.
bool isError(dynamic v) => v is BaseError;
