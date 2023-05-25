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

  static contain13numbers(String barcode, VoidCallback onTap) {
    if (barcode.length == 13) {
      return onTap;
    } else {
      return null;
    }
  }
}
