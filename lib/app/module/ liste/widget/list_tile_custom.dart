import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const ListTileCustom({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 250,
      child: ListTile(
        onTap: onTap,
        style: ListTileStyle.drawer,
        title: Text(name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        trailing: Icon(icon, size: 30),
      ),
    );
  }
}
