import 'package:flutter/material.dart';
import 'package:new_project/api/api.dart';
import 'package:new_project/entitis/category.dart';

class CategoriesScreenModel extends ChangeNotifier {
  final api = Api();

  Future<List<Category>> getAllCategories() async {
    final allCategories = await api.getAllCategories();
    return allCategories;
  }
}
