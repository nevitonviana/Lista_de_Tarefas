import '../models/product_models.dart';

abstract class ProductService {
  Future<void> create({required ProductModels productModels});

  Future<List<ProductModels>> get({required String option});

  Future<List<ProductModels>> search({required String barcode});

  Future<void> update({required ProductModels productModels});

  Future<void> delete({required int id});
}
