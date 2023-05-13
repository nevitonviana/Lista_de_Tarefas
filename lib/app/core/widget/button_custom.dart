import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String name;
  final IconData? icon;
  final Color color;
  final double width;
  final VoidCallback onTap;

  const ButtonCustom(
      {Key? key,
      required this.name,
      this.icon,
      required this.onTap,
      this.color = Colors.grey,
      this.width = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
            backgroundColor: color,
            elevation: 3,
            fixedSize: const Size(180, 30)),
        onPressed: onTap,
        icon: Icon(icon, size: 30),
        label: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
