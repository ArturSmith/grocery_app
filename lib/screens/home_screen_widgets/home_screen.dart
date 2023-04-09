// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/entitis/category.dart';
import 'package:new_project/models/home_screen_model.dart';
import 'package:new_project/screens/home_screen_widgets/home_screen_section.dart';
import '../../widgets/my_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  HomeScreenModel readModel(BuildContext context) {
    return context.read<HomeScreenModel>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readModel(context).getAllCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          List<HomeScreenSection> sections = [];

          if (snapshot.hasData) {
            final data = snapshot.data as List<Category>;
            for (var category in data) {
              final randomColor =
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt());

              final products =
                  readModel(context).getProductsOfCategory(category.id);
              final section = HomeScreenSection(
                  color: randomColor.withOpacity(1.0),
                  products: products,
                  emptylistText:
                      "We don't have any products of ${category.name} category",
                  movableStringText: category.name);
              sections.add(section);
            }
          }

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              MySwiper(),
              HomeScreenSection(
                color: Colors.red,
                products: readModel(context).getProdsWithDiscount(),
                emptylistText: "We don't have any discounted products :(",
                movableStringText: 'BEST PRICE',
              ),
              HomeScreenSection(
                color: Colors.green,
                products: readModel(context).getSeasonalProducts(),
                emptylistText: "We don't have any seasonal products :(",
                movableStringText: 'SEASONAL PRODUCTS',
              ),
              ...sections
            ],
          );
        });
  }
}
