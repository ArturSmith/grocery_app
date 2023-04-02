import 'package:flutter/material.dart';
import 'package:new_project/fakeDataBase.dart';
import 'package:new_project/objects/category.dart';
import 'package:provider/provider.dart';
import '../constants/strings.dart';

class CategoriesScreenModel extends ChangeNotifier {
  late Future<List<Category>> categories;

  void getData(BuildContext context) async {
    final db = Provider.of<FakeDataBase>(context);
    final json = db.getCategoriesInfo();
    List<Category> finalListOfCategories = [];
    for (var element in json) {
      final _category = Category(element[Str.NAME], element[Str.ID],
          element[Str.IMAGE], element[Str.COLOR], null);
      finalListOfCategories.add(_category);
    }
    categories = Future.delayed(
        const Duration(microseconds: 600), (() => finalListOfCategories));
  }
}
