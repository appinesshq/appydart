import 'package:meta/meta.dart';
import 'package:appydart/token/token.dart';
export 'package:appydart/token/token.dart';

@immutable
class Session<T extends BaseToken, U> {
  final T token;
  final U? user;

  const Session({required this.token, this.user});

  bool get isExpired => token.isExpired;
  bool get isValid => !isExpired;
  bool get hasAuthenticatedUser => user != null;
  U getAuthenticatedUser() => user!;
}
