// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:new_project/api/api.dart';
import 'package:new_project/entities/product.dart';
import '../constants/strings.dart';

class FavoritesScreenModel extends ChangeNotifier {
  final box = Hive.box(Str.BOX_OF_PRODUCTS_ID);
  final api = Api();

  List<Product> favoriteProducts = [];

  addProduct(String id) async {
    if (!box.containsKey(id)) {
      final product = await api.returnProductByID(id);
      await box.put(id, id);
      favoriteProducts.add(product);
    } else {
      favoriteProducts.removeWhere((element) => element.id == id);
      await box.delete(id);
    }
    notifyListeners();
  }

  loadProductsFromHive() async {
    final listOfIDs = box.values.toList();

    for (var id in listOfIDs) {
      final product = await api.returnProductByID(id);
      if (product != null) {
        favoriteProducts.add(product);
      }
    }
  }
}
