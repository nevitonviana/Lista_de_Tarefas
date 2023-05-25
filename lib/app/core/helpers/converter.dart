import 'package:flutter/foundation.dart';

class Converter {
  Converter._();

  static isBool(String name) {
    if (name == "true") {
      return true;
    } else {
      return false;
    }
  }

  static data(String date) {
    if (date.isNotEmpty) {
      return DateTime.parse(date);
    } else {
      return DateTime.now();
    }
  }
}
