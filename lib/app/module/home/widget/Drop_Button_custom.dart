import 'package:flutter/material.dart';

class DropButtonCustom extends StatelessWidget {
  final Function(int? value)? onChanged;

  const DropButtonCustom({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: const Text(
        'Opções',
        style: TextStyle(fontSize: 18),
      ),
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text("Rebaixa"),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text("Quebra"),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text("Transformar"),
        ),
        DropdownMenuItem(
          value: 4,
          child: Text("Outros"),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
