import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/helpers/format_date.dart';
import '../../../core/widget/button_custom.dart';
import '../../../core/widget/messages.dart';
import '../../../models/product_models.dart';
import 'text_view.dart';

class DialogView {
  viewData(
      {required BuildContext context, required ProductModels productModels}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        icon: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.clear_rounded),
          ),
        ),
        elevation: 5,
        title: const Text('Informações'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextView(label: "Name:", name: productModels.name),
            TextView(
              label: "Codigo:",
              name: productModels.barcode,
              onLongPress: () async {
                await Clipboard.setData(
                    ClipboardData(text: productModels.barcode));
                // ignore: use_build_context_synchronously
                Messages.copiedSuccess(context);
              },
            ),
            TextView(
                label: "Data:", name: Formatter().data(productModels.date)),
            TextView(label: "Opção:", name: productModels.option),
            TextView(
                label: "Quantidade:",
                name: productModels.amount ?? "Sem Informações"),
            TextView(
                label: "Descrição:",
                name: productModels.description ?? "Sem Informações"),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ButtonCustom(
            onTap: () async {
              await Modular.to.pushNamed("/home", arguments: productModels);
            },
            width: 120,
            name: 'Editar',
            color: Colors.blue,
            icon: Icons.edit,
          ),
          const SizedBox(width: 10),
          Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue.shade200,
            ),
            child: IconButton(
              disabledColor: Colors.grey,
              onPressed: () => _barcodeGenerator(
                  context: context, nubarBarcode: productModels.barcode),
              icon: const Icon(
                Icons.qr_code_2,
              ),
              color: Colors.black,
              iconSize: 35,
            ),
          )
        ],
      ),
    );
  }
}

_barcodeGenerator(
    {required BuildContext context, required String nubarBarcode}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.clear_sharp),
        ),
      ),
      content: BarcodeWidget(
        data: nubarBarcode,
        barcode: Barcode.ean13(drawEndChar: false),
        height: 80,
        width: 110,
        errorBuilder: (context, error) =>
            const Text('Código muito pequeno, para gerar um código de barra',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center),
      ),
    ),
  );
}
