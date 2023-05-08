import 'package:flutter/material.dart';

class DialogCustom {
  Future<String?> showDate({required BuildContext context}) async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: const Locale("pt", 'BR'),
    );
    return data.toString();
  }
}
