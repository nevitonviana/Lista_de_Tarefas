import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/helpers/format_date.dart';
import '../../core/widget/dialog_custom.dart';
import '../base_controller.dart';
import 'widget/card_list_custom.dart';
import 'widget/dialog_view.dart';

class ListProductsPage extends StatefulWidget {
  final String _name;

  const ListProductsPage({
    Key? key,
    required String name,
  })  : _name = name,
        super(key: key);

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  final _controller = Modular.get<BaseController>();

  @override
  void initState() {
    super.initState();
    _controller.get(option: widget._name.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text(widget._name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: _controller.listProduct.length,
              itemBuilder: (context, index) {
                final product = _controller.listProduct[index];
                return CardListCustom(
                  name: product.name,
                  barcode: product.barcode,
                  date: Formatter().data(product.date),
                  onTap: () {
                    DialogView().viewData(
                      context: context,
                      productModels: product,
                    );
                  },
                  onLongPress: () async {
                    await DialogCustom().bottomSheetCustom(
                        context: context,
                        productModels: product,
                        controller: _controller);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
