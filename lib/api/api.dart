import 'package:new_project/constants/strings.dart';
import 'package:new_project/fakeDataBase.dart';

class Api {
  final dbInstance = FakeDataBase(Str.DB_INSTANCE);

  getAllCategoriesAndProducts() async {
    Future.delayed(const Duration(seconds: 3));
    final data = dbInstance.allCategoriesAndProducts;
    return data;
  }
}
