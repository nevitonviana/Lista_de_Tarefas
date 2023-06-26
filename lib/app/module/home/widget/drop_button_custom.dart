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
            value: 'rebaixa',
            child: Text("Rebaixa"),
          ),
          DropdownMenuItem(
            value: 'consumo',
            child: Text("Consumo"),
          ),
          DropdownMenuItem(
            value: "quebra",
            child: Text("Quebra"),
          ),
          DropdownMenuItem(
            value: "transformar",
            child: Text("Transformar"),
          ),
          DropdownMenuItem(
            value: "outros",
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
