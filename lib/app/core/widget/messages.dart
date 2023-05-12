import 'package:flutter/material.dart';

class Messages {
  Messages._();

  static void alert({required BuildContext context, required String massage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          massage,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
        elevation: 5,
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
