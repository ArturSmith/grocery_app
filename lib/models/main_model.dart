import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:new_project/api/api.dart';
import 'package:new_project/constants/strings.dart';

class MainModel extends ChangeNotifier {
  String name;
  static MainModel instance = MainModel.fromName('');
  MainModel.fromName(this.name) {
    saveDataInBox();
    sortData();
  }

  factory MainModel() {
    if (instance.name == '') {
      instance = MainModel.fromName("MainModel");
    }
    return instance;
  }

  void saveDataInBox() async {
    final allData =
        Api().getAllCategoriesAndProducts() as List<Map<String, dynamic>>;

    final bool isBoxExist = await Hive.boxExists(Str.BOX);
    if (!isBoxExist) {
      await Hive.openBox<dynamic>(Str.BOX);
    }
    final box = Hive.box(Str.BOX);

    box.put(Str.ALL_CAT_AND_PROD, allData);
  }

  void sortData() async {
    final box = Hive.box(Str.BOX);
    final allData = box.get(Str.ALL_CAT_AND_PROD) as List<Map<String, dynamic>>;
    final allCategories = getAllCategories(allData);
    await box.put(Str.ALL_CATEGORIES, allCategories);

    final allProducts = getAllProducts(allData);
    await box.put(Str.ALL_PRODUCTS, allProducts);

    final allProductsWithDiscount = getAllProductsWithDiscount();
    await box.put(Str.ALL_PRODUCTS_WITH_DISCOUNT, allProductsWithDiscount);
  }

  List<Map<String, dynamic>> getAllCategories(List<Map<String, dynamic>> data) {
    List<Map<String, dynamic>> list = [];
    for (var element in data) {
      final map = {
        Str.ID: element[Str.ID],
        Str.NAME: element[Str.NAME],
        Str.IMAGE: element[Str.IMAGE],
      };
      list.add(map);
    }
    return list;
  }

  List<Map<String, dynamic>> getAllProducts(List<Map<String, dynamic>> data) {
    final List<Map<String, dynamic>> allProducts = [];

    for (var category in data) {
      final productsList = category[Str.PRODUCTS] as List<Map<String, dynamic>>;
      for (var product in productsList) {
        allProducts.add(product);
      }
    }
    return allProducts;
  }

  List<Map<String, dynamic>> getAllProductsWithDiscount() {
    List<Map<String, dynamic>> allProductsWithDiscount = [];
    final box = Hive.box(Str.BOX);
    final allProds = box.get(Str.ALL_PRODUCTS) as List<Map<String, dynamic>>;
    for (var product in allProds) {
      if (product[Str.DISCOUNT] != null) {
        allProductsWithDiscount.add(product);
      }
    }
    return allProductsWithDiscount;
  }

  List<Map<String, dynamic>> getProductsOfCategory(String id) {
    List<Map<String, dynamic>> products = [];
    final box = Hive.box(Str.BOX);
    final _allCategories = box.get(Str.ALL_CATEGORIES);
    for (Map<String, dynamic> element in _allCategories) {
      if (element[Str.ID] == id) {
        products = element[Str.PRODUCTS];
        break;
      }
    }
    return products;
  }
}
