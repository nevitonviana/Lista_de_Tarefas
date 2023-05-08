import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final String label;
  final  Icon icon;

  const TextFieldCustom({
    Key? key,
    required this.label,
    required this.icon,
    this.textEditingController,
    this.initialValue,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        initialValue: initialValue,
        decoration: InputDecoration(
          prefixIcon: icon,
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
