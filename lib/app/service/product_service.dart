import '../models/product_models.dart';

abstract class ProductService {
  Future<void> create({ProductModels productModels});

  Future<List<ProductModels>> get({required String option});

  Future<void> update({ProductModels productModels});

  Future<void> delete({int id});
}
