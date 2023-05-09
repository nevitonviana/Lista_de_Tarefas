import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  const ButtonCustom({Key? key, required this.name, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
          backgroundColor: Colors.grey,
          elevation: 3,
          fixedSize: const Size(180, 30)),
      onPressed:onTap,
      icon:  Icon(icon , size: 30),
      label:  Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
