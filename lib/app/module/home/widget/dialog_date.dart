import 'package:flutter/material.dart';

import '../../base_controller.dart';

class DialogDate {
  Future<void> showDate(
      {required BuildContext context,
      required BaseController controller,
      String? dateTime}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: dateTime != null ? DateTime.parse(dateTime) : DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: const Locale("pt", 'BR'),
    );
    controller.setDate(date.toString());
  }
}
