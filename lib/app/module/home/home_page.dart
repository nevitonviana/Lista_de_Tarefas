import 'package:flutter/material.dart';

import 'widget/drop_button_custom.dart';
import 'widget/button_custom.dart';
import 'widget/dialog_custom.dart';
import 'widget/text_field_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextFieldCustom(
                label: "Nome",
                icon: Icon(Icons.drive_file_rename_outline_outlined),
              ),
              const SizedBox(height: 15),
              const TextFieldCustom(
                label: "Codido",
                icon: Icon(Icons.integration_instructions_outlined),
              ),
              Visibility(
                visible: false,
                child: Column(
                  children: const [
                    SizedBox(height: 15),
                    TextFieldCustom(
                      label: "Obiservações",
                      icon: Icon(
                        Icons.description_rounded,
                      ),
                      textInputType: TextInputType.multiline,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        DialogCustom().showDate(context: context);
                      },
                      icon: const Icon(Icons.calendar_month_outlined, size: 40),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "data",
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    DropButtonCustom(
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              ButtonCustom(
                name: "salvar",
                icon: Icons.save_rounded,
                onTap: () {},
              ),
              const SizedBox(height: 10),
              ButtonCustom(
                name: "Escanear",
                icon: Icons.camera_enhance_outlined,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
