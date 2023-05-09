import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final String label;
  final  Icon icon;
  final TextInputType textInputType;
  const TextFieldCustom({
    Key? key,
    required this.label,
    required this.icon,
    this.textEditingController,
    this.initialValue,
    this.validator, this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        initialValue: initialValue,
        keyboardType: textInputType,
        maxLines: null,
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
