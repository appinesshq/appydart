import 'package:meta/meta.dart';

@immutable
abstract class BaseToken {
  const BaseToken();

  // Map<String, dynamic>? toMap();
  dynamic get(String property);
  bool get isExpired;
}

@immutable
class Token extends BaseToken {
  final DateTime expiresAt;
  final Map<String, dynamic> data;

  const Token({required this.expiresAt, required this.data});

  @override
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  @override
  dynamic get(String property) {
    if (!data.containsKey(property)) {
      throw Exception('property not found');
    }
    return data[property];
  }
}
