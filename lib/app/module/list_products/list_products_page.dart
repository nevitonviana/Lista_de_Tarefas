import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../base_controller.dart';
import 'widget/card_list_custom.dart';

class ListProductsPage extends StatelessWidget {
  final String _name;

  const ListProductsPage({
    Key? key,
    required String name,
  })  : _name = name,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<BaseController>();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text(_name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: ListView.builder(
            itemCount: controller.listProduct.length,
            itemBuilder: (context, index) {
              final product = controller.listProduct[index];
              return CardListCustom(
                name: product.name,
                barcode: product.barcode,
                date: product.date,
                onLongPress: () {},
              );
            }),
      ),
    );
  }
}
