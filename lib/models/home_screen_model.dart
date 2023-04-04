import 'package:flutter/cupertino.dart';
import 'package:new_project/api/api.dart';
import 'package:new_project/entitis/product.dart';

class HomeScreenModel extends ChangeNotifier {
  final api = Api();

  Future<List<Product>> getAllProdsWithDiscount() {
    return Future.delayed(
        const Duration(seconds: 3), (() => api.getAllProductsWithDiscount()));
  }
}
