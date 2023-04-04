import 'package:new_project/constants/strings.dart';
import 'package:new_project/entitis/category.dart';
import 'package:new_project/entitis/product.dart';
import 'package:new_project/fakeDataBase.dart';

class Api {
  final String id;
  static Api instance = Api.withID("");
  Api.withID(this.id);

  factory Api() {
    if (instance.id == '') {
      instance = Api.withID("apiInstance");
    }
    return instance;
  }

  final dbInstance = FakeDataBase(Str.DB_INSTANCE);

  List<Map<String, dynamic>> getAllCategoriesAndProducts() {
    final data =
        dbInstance.allCategoriesAndProducts as List<Map<String, dynamic>>;
    return data;
  }

  List<Category> getAllCategories() {
    final allCategoriesJson = dbInstance.getAllCategories();
    List<Category> categories = [];

    for (var category in allCategoriesJson) {
      final productsJson = category[Str.PRODUCTS];
      List<Product> products = [];
      for (var product in productsJson) {
        final finalProduct = Product(
            product[Str.NAME],
            product[Str.IMAGE],
            product[Str.ID],
            product[Str.PRICE],
            product[Str.PRODUCT_COUNT],
            product[Str.DISCOUNT]);
        products.add(finalProduct);
      }
      final fromJsom = Category(
          category[Str.NAME], category[Str.ID], category[Str.IMAGE], products);
      categories.add(fromJsom);
    }

    return categories;
  }

  List<Product> getAllProductsWithDiscount() {
    final allProdsWithDiscount = dbInstance.getAllProductsWithDiscount();
    List<Product> productsWithDiscount = [];

    for (var product in allProdsWithDiscount) {
      final finalProduct = Product(
          product[Str.NAME],
          product[Str.IMAGE],
          product[Str.ID],
          product[Str.PRICE],
          product[Str.PRODUCT_COUNT],
          product[Str.DISCOUNT]);

      productsWithDiscount.add(finalProduct);
    }

    return productsWithDiscount;
  }

  List<Product> getProductsOfCategory(String id) {
    final allCategories = getAllCategories();

    List<Product> products = [];

    for (var category in allCategories) {
      if (category.id == id) {
        products = category.products;
        break;
      }
    }
    return products;
  }
}
