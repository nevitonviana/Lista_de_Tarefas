import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/product_models.dart';
import '../service/product_service.dart';

part 'base_controller.g.dart';

// ignore: library_private_types_in_public_api
class BaseController = _BaseControllerBase with _$BaseController;

abstract class _BaseControllerBase with Store {
  final ProductService _productService;

  _BaseControllerBase({required ProductService productService})
      : _productService = productService;

  @observable
  List listProduct = <ProductModels>[];

  @observable
  String? option;

  @action
  void setOption(String? value) => option = value;

  @observable
  String date = '';

  @computed
  bool get validOD => date.isNotEmpty && option != null;

  String get validError {
    if (!validOD) {
      return "Campos Data e Opções São Obrigatorio";
    } else {
      return '';
    }
  }

  @action
  void setDate(String value) => date = value;

  Future<void> create(
      {required String name,
      required String barcode,
      String? amount,
      String? observations}) async {
    final productModels = ProductModels(
        name: name,
        barcode: barcode,
        date: date,
        option: option!,
        amount: amount,
        description: observations);
    await _productService.create(productModels: productModels);
  }

  Future<void> get({required String option}) async {
    listProduct.clear();
    final result = await _productService.get(option: option);
    listProduct = result;
  }

  Future<void> update({required ProductModels productModels}) async {
    var product = productModels;
    product = productModels;
    await _productService.update(
        productModels: product.copyWith(date: date, option: option));
    Modular.to.pop();
    Modular.to.pop();
    await get(option: productModels.option);
  }

  Future<void> delete({required ProductModels productModels}) async {
    await _productService.delete(id: productModels.id!);
    await get(option: productModels.option);
  }
}
