import 'package:flutter/material.dart';

import 'widget/list_tile_custom.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Card(
          elevation: 5,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            alignment: Alignment.center,
            height: 350,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ListTileCustom(name: 'Rebaixa', icon: Icons.paid_outlined,),
                ListTileCustom(name: 'Quebra', icon: Icons.delete_outlined),
                ListTileCustom(name: 'Transformar',icon: Icons.flip_camera_android_rounded),
                ListTileCustom(name: 'Outros',icon: Icons.more,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
