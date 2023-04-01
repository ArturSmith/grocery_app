// Здесь должен быть код который делает запрос в сервер при отображении CategoriesScreen widget.
// Данная модель получает ответ из сервера и натоснове этих данных отображает элементы страницы

import 'package:flutter/material.dart';
import 'package:new_project/fakeDataBase.dart';
import 'package:provider/provider.dart';

class CategoriesScreenModel extends ChangeNotifier {
  Future<List<Map<String, dynamic>>> getData(BuildContext context) {
    final db = Provider.of<FakeDataBase>(context);
    final listOfCategories = db.getInfo();
    return Future.delayed(const Duration(seconds: 3), (() => listOfCategories));
  }
}
