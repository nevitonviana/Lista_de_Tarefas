import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/helpers/format_date.dart';
import '../../../core/widget/button_custom.dart';
import '../../../models/product_models.dart';
import '../../base_controller.dart';
import 'text_view.dart';

class DialogView {
  viewData(
      {required BuildContext context, required ProductModels productModels}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          icon: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.clear_rounded),
            ),
          ),
          elevation: 5,
          title: const Text('Informações'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextView(label: "Name:", name: productModels.name),
            TextView(label: "Codigo:", name: productModels.barcode),
            TextView(
                label: "Data:", name: Formatter().data(productModels.date)),
            TextView(label: "Opção:", name: productModels.option),
            TextView(
                label: "Quantidade:",
                name: productModels.amount ?? "Sem Informações"),
            TextView(
                label: "Descrição:",
                name: productModels.description ?? "Sem Informações"),
          ]),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ButtonCustom(
              onTap: () async {
                await Modular.to.pushNamed("/home", arguments: productModels);
              },
              name: 'Editar',
              color: Colors.blue,
              icon: Icons.edit,
            ),
          ]),
    );
  }
}
