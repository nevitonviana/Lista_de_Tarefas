import 'package:flutter/material.dart';

class DateIndicator {
  validityColor({required String date}) {
    if (date.isNotEmpty) {
      final dataProduct = DateTime.parse(date);
      final dataDifference = DateTime.now().difference(dataProduct).inDays;
      if (dataDifference == 0) {
        return Colors.red.shade200;
      } else if (dataDifference >= -10) {
        return Colors.yellow.shade200;
      }
    } else {
      return Colors.deepPurple.shade100;
    }
  }
}
