import 'package:flutter/material.dart';

import '../../../core/helpers/format_date.dart';
import 'date_indicator.dart';

class CardListCustom extends StatelessWidget {
  final String name;
  final String barcode;
  final String date;
  final bool isDowngrade;
  final bool isValidityColor;
  final VoidCallback onLongPress;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  const CardListCustom({
    Key? key,
    required this.name,
    required this.barcode,
    required this.date,
    required this.isValidityColor,
    required this.isDowngrade,
    required this.onLongPress,
    required this.onTap,
    required this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: isDowngrade ? Colors.blue : Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      elevation: 6,
      // color: isValidityColor
      //     ? DateIndicator().validityColor(date: date)
      //     : Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: GestureDetector(
          onDoubleTap: onDoubleTap,
          child: ListTile(
            onLongPress: onLongPress,
            onTap: onTap,
            title: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              barcode,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              Formatter().data(date),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
