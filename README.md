# AppyDart

AppyDart is an open source library with components used within [Appiness](https://appiness.solutions). Allthough anyone may use the library, it is tailored around the programming idiomacies within Appiness.

The content of the libary is particularly meant for implementing Clean Architecture inspired code bases. Therefore the main purpose of this package is to provide types for prolongating results and errors without throwing, as this would violate the CA philosophy.

## Copyright and license
Copyright 2022 [UAB "Appiness"](https://appiness.solutions).
```
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
  ```

## State
Under heavy development, not recommended to use in production. Breaking API changes can occur frequently until the package reaches version 1.0.0.

## Features

### Result
The result package is meant for passing results instead of try/catch blocks.

- *Error* is a class for error communication where throwing errors is not an option.
- *Result* is a class for returning a result that can be either ok or error.
- *Option* is a class for returning none or some value.
- *Either* is a class for returning a value in an "either or" style where Result or Option would not be appropriate.

### Session
The session package is a simple object for session management.

### Token
The token package provides the creation of session tokens, including JWT tokens.

### Usecase
The usecase package provides a base for clean architecture use cases.

## Getting started

The package will work for Dart and Flutter. 
Import the package as usual and you're good to go. 

## Usage

More examples will be provided soon.

### Error and Result
Prolongation of results and errors can be done in a Rust or Go style. 
An example of both has been provided, as well as defining errors and creating custom errors.

The package is agnostic about the style used. This decision should be taken for each project or dev team individually.

```dart
import 'package:appydart/result/error.dart';

// Default errors are string based.
const exampleErr = Error('this is an error');

// Custom errors give more flexibility.
class ValidationError implements BaseError {
  final String field;
  final String value;
  final String msg;

  ValidationError(
      {required this.field, required this.value, required this.msg});

  @override
  String error() => 'field $field with value $value: $msg';
}

void main() {
  // Dealing with errors

  // Define one of our custom validation errors.
  final err =
      ValidationError(field: 'email', value: 'test', msg: 'invalid email');

  // Every kind of error can be detected as an error
  // with the isError function.
  print('isError(exampleErr): ${isError(exampleErr)}');
  print('isError(err): ${isError(err)}');

  // isErrorType can be used for more specific detection of errors.
  print(
      'isErrorType<ValidationError>(err): ${isErrorType<ValidationError>(err)}');

  // Dealing with results

  // Define a successful result
  final a = Result.ok('This is a success');

  // Defining an error result works with all kinds of errors
  // including our custom validation error.
  final b = Result.error(exampleErr);
  final c = Result.error(err);

  // Deal with results through a switch statement (Rust style)
  switch (a.state) {
    case ResultState.ok:
      // Do something
      break;
    case ResultState.error:
      // Deal with error
      break;
  }

  // Deal with results through error checking.
  if (b.isError()) print('An error occured at b: ${b.error}');
  if (c.isErrorAnd((err) => isErrorType<ValidationError>(err))) {
    print('validation went wrong at c');
  }

  // Check for a succesful result.
  if (a.isOk()) print('a succeeded: ${a.value}');
}
```

### Happy path (Go style)
```dart
import 'dart:io';
import 'package:appydart/result/result.dart';

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
```