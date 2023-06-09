import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/helpers/converter.dart';
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

  optionsChecker() {
    if (widget._name != 'Resultado') {
      _controller.get(option: widget._name.toLowerCase());
    }
  }

  @override
  void initState() {
    super.initState();
    optionsChecker();
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
            return _controller.listProduct.isNotEmpty
                ? ListView.builder(
                    itemCount: _controller.listProduct.length,
                    itemBuilder: (context, index) {
                      final product = _controller.listProduct[index];
                      return CardListCustom(
                        name: product.name,
                        barcode: product.barcode,
                        date: product.date,
                        isDowngrade: Converter.isBool(product.isDowngrade),
                        isValidityColor:
                            widget._name == 'Rebaixa' ? true : false,
                        onTap: () async {
                          await DialogView().viewData(
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
                        onDoubleTap: () async {
                          final isDowngrade =
                              !Converter.isBool(product.isDowngrade);
                          await _controller.updateDowngrade(
                              productModels: product.copyWith(
                                  isDowngrade: isDowngrade.toString()));
                        },
                      );
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Não foi encontrado nem uma: ${widget._name}",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
