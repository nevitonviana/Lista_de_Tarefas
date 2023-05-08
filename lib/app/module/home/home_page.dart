import 'package:flutter/material.dart';

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
      body: Container(
        child: Column(
          children: [
            TextFieldCustom(
                label: "Nome",
                icon: Icon(Icons.drive_file_rename_outline_outlined)),
            TextFieldCustom(
              label: "Codido",
              icon: Icon(Icons.integration_instructions_outlined),
            ),
            TextButton(
              onPressed: () {
                DialogCustom().showDate(context: context);
              },
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
