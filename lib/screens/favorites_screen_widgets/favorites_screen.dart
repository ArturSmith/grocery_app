// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/constants/consts.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/models/favorites_screen_model.dart';
import 'package:new_project/widgets/product_card.dart';
import '../../constants/strings.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoritesScreenModel provider(BuildContext context, bool watch) {
    return Provider.of<FavoritesScreenModel>(context, listen: watch);
  }

  @override
  Widget build(BuildContext context) {
    final favorites = provider(context, true).favoriteProducts;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeStyles.setThemeColor(context, false),
          ),
          onPressed: (() {
            Navigator.pushReplacementNamed(context, Str.HOME_SCREEN);
          }),
        ),
        centerTitle: true,
        title: Text(
          "Favorites",
          style: MyTextDecoration.titleTextStyle(context),
        ),
        flexibleSpace: Consts.isDark(context)
            ? null
            : Container(
                decoration: const BoxDecoration(gradient: ThemeStyles.gradient),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: favorites.length,
            itemBuilder: ((context, index) {
              return ProductCard(
                  id: favorites[index].id,
                  name: favorites[index].name,
                  image: favorites[index].image,
                  price: favorites[index].price,
                  discount: favorites[index].discount,
                  count: favorites[index].count,
                  isSeasonal: favorites[index].isSeasonal);
            })),
      ),
    );
  }
}
