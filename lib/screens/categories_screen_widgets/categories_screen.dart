import 'package:flutter/material.dart';
import 'package:new_project/screens/categories_screen_widgets/category_card_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Map<String, dynamic>> data = [
    {
      "color": Colors.red,
      "categoryName": "Fruits",
      "image": "lib/assets/images/fruits.svg"
    },
    {
      "color": Colors.green,
      "categoryName": "Vegetables",
      "image": "lib/assets/images/pumpkin.svg"
    },
    {
      "color": Colors.yellow,
      "categoryName": "Drinks",
      "image": "lib/assets/images/drink.svg"
    },
    {
      "color": Colors.purple,
      "categoryName": "Alhocol",
      "image": "lib/assets/images/cocktail.svg"
    },
    {
      "color": Colors.blue,
      "categoryName": "Fish",
      "image": "lib/assets/images/fish.svg"
    },
    {
      "color": Colors.cyan,
      "categoryName": "Cakes",
      "image": "lib/assets/images/cake.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 240 / 240,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              crossAxisCount: 2),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryCardWidget(
                categoryName: data[index]["categoryName"],
                color: data[index]["color"],
                image: data[index]["image"]);
          }),
    );
  }
}
