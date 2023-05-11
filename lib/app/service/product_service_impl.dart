import 'package:lista_tarefas/app/models/product_models.dart';

import '../core/sqflite_db.dart';
import 'product_service.dart';

class ProductServiceImpl extends ProductService {
  @override
  Future<void> create({required ProductModels productModels}) async {
    try {
      final db = SqfliteDb();
      await db.create(productModels: productModels);
    } catch (e) {
      //ToDO
    }
  }

  @override
  Future<List<ProductModels>> get({required String option}) async {
    var listProduct = <ProductModels>[];
    try {
      final db = SqfliteDb();
      final result = await db.get(option: option);
      final listProduct = result.map<ProductModels>((e) {
        return ProductModels.fromMap(e as Map<String, dynamic>);
      }).toList();
      return listProduct;
    } catch (e) {
      throw e;
      //ToDO
    }
  }

  @override
  Future<void> update({required ProductModels productModels}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required int id}) async {
    try {
      final db = SqfliteDb();
      await db.delete(id: id);
    } catch (e) {
      //ToDO
    }
  }
}