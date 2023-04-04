import 'package:flutter/material.dart';
import 'package:new_project/entitis/category.dart';
import 'package:new_project/screens/categories_screen_widgets/category_card_widget.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 240 / 240,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0,
              crossAxisCount: 2),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryCardWidget(
              id: categories[index].id,
              categoryName: categories[index].name,
              image: categories[index].image,
              products: categories[index].products,
            );
          }),
    );
  }
}
