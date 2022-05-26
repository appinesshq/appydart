/// OptionState is some or none.
/// It represents the state of an Opion.
enum OptionState {
  some,
  none;
}

/// Option is used as a result that represents some value or none.
class Option<T> {
  OptionState option;
  final T? _value;

  /// Option.some is the constructor for an Option with some value.
  Option.some(this._value) : option = OptionState.some;

  /// Option.none is the constructor for an Option with no value.
  Option.none()
      : option = OptionState.none,
        _value = null;

  /// value is a getter that returns the value.
  ///
  /// Throws if there is no value.
  T get value => _value!;

  /// isSome returns true if a value is set (some).
  bool isSome() => _value != null;

  /// isNone returns false if no value is set (none).
  bool isNone() => _value == null;

  /// isState returns true if the state equals v.
  bool isState(OptionState v) => option == v;

  @override
  String toString() {
    if (isNone()) return 'none';
    return 'some: ${_value.toString()}';
  }
}
