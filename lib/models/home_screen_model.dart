import 'package:flutter/cupertino.dart';
import 'package:new_project/api/api.dart';
import 'package:new_project/entitis/product.dart';

class HomeScreenModel extends ChangeNotifier {
  final api = Api();

  List<Product> products = [];

  Future<List<Product>> getProdsWithDiscount() {
    final prods = api.getAllProductsWithDiscount();
    return prods;
  }

  set setProducts(List<Product> products) {
    this.products = products;
    notifyListeners();
  }
}
