import 'package:flutter/cupertino.dart';
import 'package:new_project/fakeDataBase.dart';
import 'package:new_project/objects/product.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';

class HomeScreenModel extends ChangeNotifier {
  late Future<List<Product>> products;

  void getProductsWithDiscount(BuildContext context) {
    final db = Provider.of<FakeDataBase>(context);
    final productsJson = db.getAllProductsWithDiscount();

    List<Product> prods = [];
    for (var element in productsJson) {
      final product = Product(
          element[Str.NAME],
          element[Str.IMAGE],
          element[Str.ID],
          element[Str.PRICE],
          element[Str.PRODUCT_COUNT],
          element[Str.DISCOUNT]);
      prods.add(product);
    }

    products = Future.delayed(const Duration(milliseconds: 600), (() => prods));
  }
}
