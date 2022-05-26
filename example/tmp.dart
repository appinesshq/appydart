import 'dart:io';
import 'package:appydart/appydart.dart';

Result<int> add(int v, int a) {
  final r = v + a;
  if (r < 0) return Result.error(Error('result can not be negative'));
  return Result.ok(r);
}

void main() {
  final r1 = add(5, 5);
  if (r1.isError()) {
    print('5 + 5 failed: ${r1.error.error()}');
    exit(1);
  }
  print('5 + 5 = ${r1.value}');

  final r2 = add(5, -10);
  if (r2.isError()) {
    print('5 + -10 failed: ${r2.error.error()}');
    exit(1);
  }
  print('5 + -10 = ${r2.value}');
}
