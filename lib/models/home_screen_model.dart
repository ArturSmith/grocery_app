import 'package:flutter/cupertino.dart';
import 'package:new_project/fakeDataBase.dart';
import 'package:new_project/objects/product.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';

class HomeScreenModel extends ChangeNotifier {
  Future<List<Product>> getProductsWithDiscount(BuildContext context) {
    final db = Provider.of<FakeDataBase>(context);
    final productsJson = db.getAllProductsWithDiscount();
    List<Product> products = [];
    for (var element in productsJson) {
      final product = Product(
          element[Str.NAME],
          element[Str.IMAGE],
          element[Str.ID],
          element[Str.PRICE],
          element[Str.PRODUCT_COUNT],
          element[Str.DISCOUNT]);
      products.add(product);
    }
    return Future.delayed(const Duration(milliseconds: 600), (() => products));
  }
}
