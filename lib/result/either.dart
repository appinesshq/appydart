/// Either can be used to return a result in an either, or style.
class Either<L, R> {
  final L? _left;
  final R? _right;

  /// Either.left is the constructor for returning a left value.
  const Either.left(this._left) : _right = null;

  /// Either.left is the constructor for returning a right value.
  const Either.right(this._right) : _left = null;

  /// isLeft returns true if the instance contains a left value.
  bool isLeft() => _left != null;

  /// isRight returns true if the instance contains a right value.
  bool isRight() => _right != null;

  /// left is a getter that returns the left value.
  ///
  /// Throws if there is no left value.
  L get left => _left!;

  /// left is a getter that returns the right value.
  ///
  /// Throws if there is no right value.
  R get right => _right!;

  /// value is a getter that returns the set value.
  dynamic get value => isLeft() ? _left! : _right!;

  @override
  String toString() {
    if (isLeft()) return 'left: ${_left.toString()}';
    return 'right: ${_right.toString()}';
  }
}
