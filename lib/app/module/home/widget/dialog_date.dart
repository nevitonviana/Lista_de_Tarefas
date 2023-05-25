// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/helpers/converter.dart';
import '../../../core/widget/button_custom.dart';
import '../../../core/widget/messages.dart';
import '../../base_controller.dart';
import 'barcode_scanner.dart';
import 'text_field_custom.dart';

class DialogCustom {
  Future<void> showDate(
      {required BuildContext context,
      required BaseController controller,
      String? dateTime}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: dateTime != null ? Converter.data(dateTime) : DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: const Locale("pt", 'BR'),
    );
    controller.setDate(date.toString());
  }

  Future<void> search(
      {required BuildContext context,
      required BaseController controller}) async {
    final barcodeEc = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Text("Buscar"),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.clear_rounded),
            )
          ],
        ),
        content: TextFieldCustom(
          textEditingController: barcodeEc,
          textInputType: TextInputType.number,
          label: "Codigo",
          icon: const Icon(
            Icons.search_rounded,
          ),
          suffixIcon: IconButton(
              onPressed: () async {
                final result = await BarcodeScanner().scanner();
                if (result != '-1') {
                  barcodeEc.text = result;
                }
              },
              icon: const Icon(Icons.barcode_reader)),
        ),
        actions: [
          ButtonCustom(
            width: 130,
            name: "Buscar",
            onTap: () async {
              await controller.search(barcode: barcodeEc.text);
              Modular.to.pop();
              if (controller.listProduct.isNotEmpty) {
                Modular.to.pushNamed('/listProducts', arguments: "Resultado");
              } else {
                Messages.notFound(context: context);
              }
            },
          ),
        ],
      ),
    );
  }
}
