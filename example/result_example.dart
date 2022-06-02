import 'package:appydart/result/result.dart';

Result<String, Error> lowerToUpper(String v) {
  if (v.toLowerCase() != v) return Result.error(Error('not lowercase'));
  return Result.ok(v.toUpperCase());
}

void main() {
  print('1. Dealing with a valid result (ok)');
  var result = lowerToUpper('this is valid');
  print('result: $result');
  if (result.isOk()) print('success: ${result.value}');
  if (result.isOkAnd((v) => v == 'THIS IS VALID')) {
    print('return value is as expected');
  }

  print('\n2. Dealing with an error result.');
  result = lowerToUpper('This is not valid');
  print('result: $result');
  if (result.isError()) print('error: ${result.error}');
}
