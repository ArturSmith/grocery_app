import 'package:flutter/cupertino.dart';
import 'package:new_project/constants/strings.dart';
import 'package:new_project/fakeDataBase.dart';

class ProductScreenModel extends ChangeNotifier {
  Future<List<Map<String, dynamic>>> getData(
      String categoryId, BuildContext context) {
    final dbInstance = FakeDataBase(Str.DB_INSTANCE);
    final categoriesList = dbInstance.getProductsOfCategory(categoryId);
    return Future.delayed(const Duration(seconds: 2), () => categoriesList);
  }
}
