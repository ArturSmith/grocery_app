import 'package:dio/dio.dart';
import 'package:new_project/entitis/category.dart';
import 'package:new_project/entitis/product.dart';

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

  Future<List<Category>> getAllCategories() async {
    final Dio dio = Dio();
    final responce =
        await dio.get("https://api.npoint.io/bffb2cb101f350e1c127");
    final List<dynamic> data = responce.data;
    return data.map((e) => Category.formJson(e)).toList();
  }

  Future<List<Product>> getAllProducts() async {
    final allCategories = await getAllCategories();

    List<Product> allProducts = [];

    for (var category in allCategories) {
      allProducts.addAll(category.products);
    }

    return allProducts;
  }

  Future<List<Product>> getAllProductsOfCategory(String id) async {
    final allCategories = await getAllCategories();

    List<Product> products = [];

    for (var category in allCategories) {
      if (category.id == id) {
        products.addAll(category.products);
        break;
      }
    }
    return products;
  }

  Future<List<Product>> getAllProductsWithDiscount() async {
    final allProducts = getAllProducts();

    List<Product> productsWithDiscount = [];

    for (var product in allProducts as List<Product>) {
      if (product.discount != 1) {
        productsWithDiscount.add(product);
      }
    }
    return productsWithDiscount;
  }

  Future<List<Product>> getAllSeasonalProducts() async {
    final allProducts = getAllProducts();

    List<Product> productsWithDiscount = [];

    for (var product in allProducts as List<Product>) {
      if (product.discount != 1) {
        productsWithDiscount.add(product);
      }
    }
    return productsWithDiscount;
  }
}
