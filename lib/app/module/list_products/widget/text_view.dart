import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String label;
  final String name;
  final VoidCallback? onLongPress;

  const TextView(
      {Key? key, required this.label, required this.name, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          InkWell(
            onLongPress: onLongPress,
            child: Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
