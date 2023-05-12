import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../base_controller.dart';

class DropButtonCustom extends StatelessWidget {
  final BaseController _controller;

  const DropButtonCustom({Key? key, required BaseController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return DropdownButton<String>(
        hint: const Text(
          'Opções',
          style: TextStyle(fontSize: 18),
        ),
        elevation: 2,
        value: _controller.option,
        items: const [
          DropdownMenuItem(
            value: 'Rebaixa',
            child: Text("Rebaixa"),
          ),
          DropdownMenuItem(
            value: "Quebra",
            child: Text("Quebra"),
          ),
          DropdownMenuItem(
            value: "Transformar",
            child: Text("Transformar"),
          ),
          DropdownMenuItem(
            value: "Outros",
            child: Text("Outros"),
          ),
        ],
        onChanged: (value) {
          _controller.setOption(value!);
        },
      );
    });
  }
}
