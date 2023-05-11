import 'package:flutter/material.dart';

import 'widget/card_list_custom.dart';

class ListProductsPage extends StatelessWidget {
  final String name;

  const ListProductsPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text(name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: ListView.builder(
          itemBuilder: (context, index) => CardListCustom(
            name: "teste",
            barcode: "code",
            date: "14/85",
            onLongPress: () {},
          ),
        ),
      ),
    );
  }
}
