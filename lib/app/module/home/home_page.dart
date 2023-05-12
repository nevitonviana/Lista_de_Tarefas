import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/widget/messages.dart';
import 'home_controller.dart';
import 'widget/drop_button_custom.dart';
import 'widget/button_custom.dart';
import 'widget/dialog_custom.dart';
import 'widget/text_field_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameEc = TextEditingController();
    final barcodeEc = TextEditingController();
    final amountEc = TextEditingController();
    final observationsEc = TextEditingController();

    String? date;
    final controller = Modular.get<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Listar Tarefas",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
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
                          textEditingController: observationsEc,
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
                          await DialogCustom().showDate(
                              context: context, controller: controller);
                        },
                        icon:
                            const Icon(Icons.calendar_month_outlined, size: 40),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Observer(builder: (_) {
                        return Text(
                          controller.date,
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
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                ButtonCustom(
                  name: "salvar",
                  icon: Icons.save_rounded,
                  onTap: () {
                    final valid = formKey.currentState?.validate() ?? false;
                    if (valid && controller.validOD) {
                      controller.create(
                          name: nameEc.text,
                          barcode: barcodeEc.text,
                          amount: amountEc.text,
                          observations: observationsEc.text);
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
