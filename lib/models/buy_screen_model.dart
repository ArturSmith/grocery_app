import 'package:flutter/cupertino.dart';

import '../objects/product.dart';

class BuyScreenModel extends ChangeNotifier {
  List<dynamic> products = [];

  addProduct(String name, id, image, int count, price, int? discount) {
    final product = Product(name, image, id, price, count, discount);
    products.add(product);
    notifyListeners();
  }

  removeproduct(String id) {
    products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  makeOrder() {}
}