import 'package:meta/meta.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'token.dart';

@immutable
class JWT implements BaseToken {
  final String token;
  final DateTime expires;

  const JWT._(this.token, this.expires);
  factory JWT.fromToken(String token) {
    final expires = Jwt.getExpiryDate(token);
    return JWT._(token, expires!);
  }

  @override
  bool get isExpired => Jwt.isExpired(token);

  @override
  String toString() => token;

  @override
  get(String property) {
    final data = Jwt.parseJwt(token);
    if (!data.containsKey(property)) {
      throw Exception('property not found');
    }
    return data[property];
  }
}
