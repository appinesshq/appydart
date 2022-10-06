import 'field.dart';
export 'field.dart';

class Form {
  final List<Field> fields;
  const Form({required this.fields});

  static bool validateFields(List<Field> fields) {
    return fields.every((value) => value.isValid);
  }

  bool validate() => validateFields(fields);
}

mixin FormMixin {
  List<Field> get fields;
  bool get isValid => Form.validateFields(fields);
}
