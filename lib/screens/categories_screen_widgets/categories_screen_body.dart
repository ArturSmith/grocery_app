import 'package:flutter/material.dart';
import 'package:new_project/constants/strings.dart';
import 'package:new_project/screens/categories_screen_widgets/category_card_widget.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 240 / 240,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              crossAxisCount: 2),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryCardWidget(
                categoryName: data[index][Str.NAME],
                color: data[index][Str.COLOR],
                image: data[index][Str.IMAGE]);
          }),
    );
  }
}
