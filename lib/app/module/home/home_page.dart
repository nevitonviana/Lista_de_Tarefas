import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/helpers/format_date.dart';
import '../../core/widget/messages.dart';
import '../../models/product_models.dart';
import '../base_controller.dart';
import 'widget/barcode_scanner.dart';
import 'widget/drop_button_custom.dart';
import '../../core/widget/button_custom.dart';
import 'widget/dialog_date.dart';
import 'widget/text_field_custom.dart';

class HomePage extends StatelessWidget {
  final ProductModels? _productModels;

  const HomePage({Key? key, ProductModels? productModels})
      : _productModels = productModels,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameEc = TextEditingController(text: _productModels?.name);
    final barcodeEc = TextEditingController(text: _productModels?.barcode);
    final amountEc = TextEditingController(text: _productModels?.amount);
    final descriptionEc =
        TextEditingController(text: _productModels?.description);
    final controller = Modular.get<BaseController>();
    controller.date = _productModels?.date ?? "";
    controller.setOption(_productModels?.option);

    clearField() {
      nameEc.clear();
      barcodeEc.clear();
      amountEc.clear();
      descriptionEc.clear();
      controller.date = '';
      controller.option = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _productModels == null ? "Listar Tarefas" : "Atualizar",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 100),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldCustom(
                  validator: Validatorless.required("Campo Obrigatorio"),
                  textEditingController: nameEc,
                  label: "Nome",
                  icon: const Icon(Icons.drive_file_rename_outline_outlined),
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  validator: Validatorless.required("Campo Obrigatorio"),
                  textEditingController: barcodeEc,
                  textInputType: TextInputType.number,
                  label: "Codido",
                  icon: const Icon(Icons.integration_instructions_outlined),
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  textInputType: TextInputType.number,
                  textEditingController: amountEc,
                  label: "Quantidade",
                  icon: const Icon(Icons.numbers_outlined),
                ),
                Observer(builder: (_) {
                  return Visibility(
                    visible: controller.option?.contains("Outros") ?? false,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        TextFieldCustom(
                          textEditingController: descriptionEc,
                          label: "Obiservações",
                          icon: const Icon(
                            Icons.description_rounded,
                          ),
                          textInputType: TextInputType.multiline,
                        ),
                      ],
                    ),
                  );
                }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await DialogDate().showDate(
                              context: context,
                              controller: controller,
                              dateTime: _productModels?.date);
                        },
                        icon:
                            const Icon(Icons.calendar_month_outlined, size: 40),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Observer(builder: (_) {
                        return Text(
                          Formatter().data(controller.date),
                          style: const TextStyle(fontSize: 18),
                        );
                      }),
                      const Spacer(),
                      DropButtonCustom(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
                ButtonCustom(
                    name: "Escanear",
                    icon: Icons.camera_enhance_outlined,
                    onTap: () async {
                      final result = await BarcodeScanner().scanner();
                      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                      print(result);
                      if (result != '-1') {
                        barcodeEc.text = result;
                      }
                    }),
                const SizedBox(height: 10),
                ButtonCustom(
                  name: "salvar",
                  icon: Icons.save_rounded,
                  onTap: () async {
                    final valid = formKey.currentState?.validate() ?? false;
                    if (valid && controller.validOD && _productModels == null) {
                      await controller.create(
                          name: nameEc.text,
                          barcode: barcodeEc.text,
                          amount: amountEc.text,
                          observations: descriptionEc.text);
                      // ignore: use_build_context_synchronously
                      Messages.success(context: context);
                      clearField();
                    } else if (_productModels != null && valid) {
                      await controller.update(
                          productModels: _productModels!.copyWith(
                        name: nameEc.text,
                        barcode: barcodeEc.text,
                        amount: amountEc.text,
                        description: descriptionEc.text,
                      ));
                    } else {
                      Messages.alert(
                          context: context, massage: controller.validError);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
