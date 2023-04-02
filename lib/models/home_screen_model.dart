import 'package:flutter/cupertino.dart';
import 'package:new_project/fakeDataBase.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends ChangeNotifier {
  Future<List<Map<String, String>>> getProductsWithDiscount(
      BuildContext context) {
    final db = Provider.of<FakeDataBase>(context);
    final products = db.getAllProductsWithDiscount();
    return Future.delayed(const Duration(seconds: 2), (() => products));
  }
}
