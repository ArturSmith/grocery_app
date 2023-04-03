import 'package:flutter/material.dart';
import 'package:new_project/fakeDataBase.dart';
import 'package:new_project/entitis/category.dart';
import '../constants/strings.dart';

class CategoriesScreenModel extends ChangeNotifier {
  late Future<List<Category>> categories;

  void getData(BuildContext context) async {
    final dbInstance = FakeDataBase(Str.DB_INSTANCE);
    final json = dbInstance.getAllCategories();
    List<Category> finalListOfCategories = [];
    for (var element in json) {
      final _category =
          Category(element[Str.NAME], element[Str.ID], element[Str.IMAGE]);
      finalListOfCategories.add(_category);
    }
    categories = Future.delayed(
        const Duration(microseconds: 600), (() => finalListOfCategories));
  }
}
