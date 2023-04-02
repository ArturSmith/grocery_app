import 'package:flutter/material.dart';
import 'constants/strings.dart';

class FakeDataBase extends ChangeNotifier {
  final _allCategories = [
    {
      Str.NAME: "Vegetables",
      Str.COLOR: Colors.green,
      Str.IMAGE: "lib/assets/images/pumpkin.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/tomato.svg",
          Str.NAME: "Tomato",
          Str.PRICE: "23",
          Str.DISCOUNT: "25"
        },
        {
          Str.IMAGE: "lib/assets/images/pumpkin.svg",
          Str.NAME: "Pumpkin",
          Str.PRICE: "30",
          Str.DISCOUNT: "60"
        }
      ]
    },
    {
      Str.NAME: "Fruits",
      Str.COLOR: Colors.red,
      Str.IMAGE: "lib/assets/images/fruits.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/fruits.svg",
          Str.NAME: "Grape",
          Str.PRICE: "23",
          Str.DISCOUNT: "35"
        },
      ]
    },
    {
      Str.NAME: "Drinks",
      Str.COLOR: Colors.yellow,
      Str.IMAGE: "lib/assets/images/drink.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/drink.svg",
          Str.NAME: "Coke",
          Str.PRICE: "23",
          Str.DISCOUNT: "60"
        },
      ]
    },
    {
      Str.NAME: "Alcohol",
      Str.COLOR: Colors.purple,
      Str.IMAGE: "lib/assets/images/cocktail.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/cocktail.svg",
          Str.NAME: "Cocktail",
          Str.PRICE: "23",
          Str.DISCOUNT: "60"
        },
      ]
    },
    {
      Str.NAME: "Fish",
      Str.COLOR: Colors.blue,
      Str.IMAGE: "lib/assets/images/fish.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/fish.svg",
          Str.NAME: "Salmon",
          Str.PRICE: "23",
          Str.DISCOUNT: "15"
        },
      ]
    },
    {
      Str.NAME: "Cakes",
      Str.COLOR: Colors.cyan,
      Str.IMAGE: "lib/assets/images/cake.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/cake.svg",
          Str.NAME: "Browny",
          Str.PRICE: "23",
        },
      ]
    },
    {
      Str.NAME: "Bakery",
      Str.COLOR: Colors.orange,
      Str.IMAGE: "lib/assets/images/dripper.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/dripper.svg",
          Str.NAME: "Croissant",
          Str.PRICE: "23",
          Str.DISCOUNT: "60"
        },
      ]
    },
    {
      Str.NAME: "Coffee",
      Str.COLOR: Colors.brown,
      Str.IMAGE: "lib/assets/images/coffee.svg",
      Str.PRODUCTS: [
        {
          Str.IMAGE: "lib/assets/images/coffee.svg",
          Str.NAME: "Cappuccino",
          Str.PRICE: "23",
          Str.DISCOUNT: "60"
        },
      ]
    },
  ];

  List<Map<String, String>> getAllProducts() {
    final List<Map<String, String>> allProducts = [];

    for (var category in _allCategories) {
      final productsList = category[Str.PRODUCTS] as List<Map<String, String>>;
      for (var product in productsList) {
        allProducts.add(product);
      }
    }
    return allProducts;
  }

  List<Map<String, String>> getAllProductsWithDiscount() {
    List<Map<String, String>> allProductsWithDiscount = [];

    for (var product in getAllProducts()) {
      if (product[Str.DISCOUNT] != null) {
        allProductsWithDiscount.add(product);
      }
    }
    return allProductsWithDiscount;
  }

  List<Map<String, dynamic>> getCategoriesInfo() {
    List<Map<String, dynamic>> list = [];
    for (var element in _allCategories) {
      final map = {
        Str.NAME: element[Str.NAME],
        Str.COLOR: element[Str.COLOR],
        Str.IMAGE: element[Str.IMAGE]
      };
      list.add(map);
    }
    return list;
  }

  List<Map<String, dynamic>> getProductsOfCategory(String name) {
    List<Map<String, dynamic>> list = [];
    for (Map<String, dynamic> element in _allCategories) {
      if (element[Str.NAME] == name) {
        list = element[Str.PRODUCTS];
        break;
      }
    }
    return list;
  }
}
