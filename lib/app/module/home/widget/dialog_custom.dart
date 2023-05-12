import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/module/home/home_controller.dart';

class DialogCustom {
  Future<void> showDate(
      {required BuildContext context,
      required HomeController controller}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: const Locale("pt", 'BR'),
    );
    controller.setDate(date.toString());
  }
}
