import 'package:flutter/material.dart';

class Messages {
  Messages._();

  static void alert({required BuildContext context, required String massage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          massage,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
        ),
        elevation: 5,
        backgroundColor: Colors.yellow,
      ),
    );
  }

  static void success({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Salvo com sucesso",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
        ),
        elevation: 5,
        backgroundColor: Colors.blue,
      ),
    );
  }

  static void notFound({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Produto não encontrado",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
        ),
        elevation: 5,
        backgroundColor: Colors.black38,
      ),
    );
  }

  static void copiedSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white.withAlpha(1),
        content: const Text("Copiado"),
      ),
    );
  }
}
