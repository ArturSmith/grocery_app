// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:new_project/api/api.dart';
import 'package:new_project/entitis/product.dart';

class ProductScreenModel extends ChangeNotifier {
  final api = Api();

  Future<List<Product>> getProductsOfCategory(String id) {
    final products = api.getAllProductsOfCategory(id);

    return products;
  }
}
