import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widget/list_tile_custom.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            alignment: Alignment.center,
            height: 350,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTileCustom(
                  name: 'Rebaixa',
                  icon: Icons.paid_outlined,
                  onTap: () {
                    Modular.to.pushNamed('/listProducts', arguments: "Rebaixa");
                  },
                ),
                ListTileCustom(
                  name: 'Quebra',
                  icon: Icons.delete_outlined,
                  onTap: () {
                    Modular.to.pushNamed('/listProducts', arguments: "Quebra");
                  },
                ),
                ListTileCustom(
                  name: 'Transformar',
                  icon: Icons.flip_camera_android_rounded,
                  onTap: () {
                    Modular.to.pushNamed('/listProducts', arguments: "Transformar");
                  },
                ),
                ListTileCustom(
                  name: 'Outros',
                  icon: Icons.more,
                  onTap: () {
                    Modular.to.pushNamed('/listProducts', arguments: "Outros");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
