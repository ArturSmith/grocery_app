import 'package:flutter/material.dart';

import 'constants/strings.dart';

class FakeDataBase extends ChangeNotifier {
  final _newCategories = [
    {
      Str.NAME: "Vegetables",
      Str.COLOR: Colors.green,
      Str.IMAGE: "lib/assets/images/pumpkin.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/tomato.svg", Str.NAME: "Tomato"},
        {Str.IMAGE: "lib/assets/images/pumpkin.svg", Str.NAME: "Pumpkin"}
      ]
    },
    {
      Str.NAME: "Fruits",
      Str.COLOR: Colors.red,
      Str.IMAGE: "lib/assets/images/fruits.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/fruits.svg", Str.NAME: "Grape"},
      ]
    },
    {
      Str.NAME: "Drinks",
      Str.COLOR: Colors.yellow,
      Str.IMAGE: "lib/assets/images/drink.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/drink.svg", Str.NAME: "Coke"},
      ]
    },
    {
      Str.NAME: "Alcohol",
      Str.COLOR: Colors.purple,
      Str.IMAGE: "lib/assets/images/cocktail.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/cocktail.svg", Str.NAME: "Cocktail"},
      ]
    },
    {
      Str.NAME: "Fish",
      Str.COLOR: Colors.blue,
      Str.IMAGE: "lib/assets/images/fish.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/fish.svg", Str.NAME: "Salmon"},
      ]
    },
    {
      Str.NAME: "Cakes",
      Str.COLOR: Colors.cyan,
      Str.IMAGE: "lib/assets/images/cake.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/cake.svg", Str.NAME: "Browny"},
      ]
    },
    {
      Str.NAME: "Bakery",
      Str.COLOR: Colors.orange,
      Str.IMAGE: "lib/assets/images/dripper.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/dripper.svg", Str.NAME: "Croissant"},
      ]
    },
    {
      Str.NAME: "Coffee",
      Str.COLOR: Colors.brown,
      Str.IMAGE: "lib/assets/images/coffee.svg",
      Str.PRODUCTS: [
        {Str.IMAGE: "lib/assets/images/coffee.svg", Str.NAME: "Cappuccino"},
      ]
    },
  ];

  List<Map<String, dynamic>> getInfo() {
    List<Map<String, dynamic>> list = [];
    for (var element in _newCategories) {
      final map = {
        Str.NAME: element[Str.NAME],
        Str.COLOR: element[Str.COLOR],
        Str.IMAGE: element[Str.IMAGE]
      };
      list.add(map);
    }
    return list;
  }

  List<Map<String, dynamic>> getProducts(String name) {
    List<Map<String, dynamic>> list = [];
    for (Map<String, dynamic> element in _newCategories) {
      if (element[Str.NAME] == name) {
        list = element[Str.PRODUCTS];
        break;
      }
    }
    return list;
  }
}
