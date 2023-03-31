import 'package:flutter/material.dart';
import 'package:new_project/screens/categories_screen_widgets/category_card_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: const [
        CategoryCardWidget(
          color: Colors.red,
          categoryName: "Fruits",
        ),
        CategoryCardWidget(color: Colors.green, categoryName: "Vegetables"),
        CategoryCardWidget(categoryName: "Drinks", color: Colors.blue),
      ],
    );
  }
}
