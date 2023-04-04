import 'package:flutter/material.dart';
import 'package:new_project/api/api.dart';
import 'package:new_project/entitis/category.dart';

class CategoriesScreenModel extends ChangeNotifier {
  final api = Api();

  Future<List<Category>> getAllCategories() {
    return Future.delayed(
        const Duration(microseconds: 500), (() => api.getAllCategories()));
  }
}
