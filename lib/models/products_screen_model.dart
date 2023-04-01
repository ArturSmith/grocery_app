import 'package:flutter/cupertino.dart';
import 'package:new_project/fakeDataBase.dart';
import 'package:provider/provider.dart';

class ProductScreenModel extends ChangeNotifier {
  Future<List<Map<String, dynamic>>> getData(
      String categoryName, BuildContext context) {
    final db = Provider.of<FakeDataBase>(context);
    final categoriesList = db.getProducts(categoryName);

    return Future.delayed(const Duration(seconds: 2), () => categoriesList);
  }
}
