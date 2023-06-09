// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:new_project/api/api.dart';
import 'package:new_project/entities/category.dart';
import 'package:new_project/entities/product.dart';

class HomeScreenModel extends ChangeNotifier {
  final api = Api();

  Future<List<Product>> getProdsWithDiscount() {
    final prods = api.getAllProductsWithDiscount();
    return prods;
  }

  Future<List<Product>> getSeasonalProducts() {
    final prods = api.getAllSeasonalProducts();
    return prods;
  }

  Future<List<Category>> getAllCategories() {
    final allCategories = api.getAllCategories();
    return allCategories;
  }

  getProductsOfCategory(String id) {
    final products = api.getAllProductsOfCategory(id);
    return products;
  }
}
