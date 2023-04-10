// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:new_project/api/api.dart';
import 'package:new_project/entities/category.dart';

class CategoriesScreenModel extends ChangeNotifier {
  final api = Api();

  Future<List<Category>> getAllCategories() async {
    final allCategories = await api.getAllCategories();
    return allCategories;
  }
}
