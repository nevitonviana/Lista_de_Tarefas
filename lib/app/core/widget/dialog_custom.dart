import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/product_models.dart';
import '../../module/base_controller.dart';
import 'button_custom.dart';

class DialogCustom {
  bottomSheetCustom(
      {required BuildContext context,
      required ProductModels productModels,
      required BaseController controller}) {
    showBottomSheet(
      backgroundColor: Colors.blueGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 5,
      context: context,
      builder: (context) => SizedBox(
        height: 150,
        child: Column(
          children: [
            Align(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  width: 140,
                  color: Colors.blue,
                  name: "Editar",
                  icon: Icons.edit,
                  onTap: () {},
                ),
                ButtonCustom(
                  width: 140,
                  color: Colors.red,
                  name: "Excluir",
                  icon: Icons.delete_forever_rounded,
                  onTap: () {
                    delete(
                      context: context,
                      name: productModels.name,
                      onTap: () async {
                        await controller.delete(productModels: productModels);
                        Modular.to.pop();
                        Modular.to.pop();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  delete(
      {required BuildContext context,
      required String name,
      required VoidCallback onTap}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Excluir',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Tem centeza que deseja excluir:",
                textAlign: TextAlign.center),
            Text(
              name,
              style: const TextStyle(fontSize: 20, color: Colors.red),
            )
          ],
        ),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actions: [
          ButtonCustom(
            width: 138,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            name: "Cancelar",
            color: Colors.red,
          ),
          ButtonCustom(
            width: 150,
            onTap: onTap,
            name: "Confirmar",
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
