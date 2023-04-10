// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/models/products_screen_model.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/favorites_screen_widgets/favorites_screen.dart';
import 'package:new_project/screens/products_screen_widgets/sun_over_info.dart';
import '../../entities/product.dart';
import '../../widgets/product_card.dart';
import 'moon_over_info.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.parentId});
  final String parentId;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    bool _isDark = provider.getDarkTheme;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: _isDark
              ? null
              : Container(
                  decoration:
                      const BoxDecoration(gradient: ThemeStyles.gradient)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: (() {
                    Consts.navigate(
                        const FavoritesScreen(), context, 300, true);
                  }),
                  icon: Icon(
                    Icons.favorite,
                    color: ThemeStyles.setThemeColor(context, false),
                  )),
            )
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ThemeStyles.setThemeColor(context, false),
            ),
            onPressed: (() {
              Navigator.of(context).pop();
            }),
          ),
          backgroundColor: ThemeStyles.setThemeColor(context, true),
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: _isDark ? const Moon() : const Sun(),
          centerTitle: true,
        ),
        body: Body(parentId: parentId));
  }
}

class Body extends StatelessWidget {
  const Body({super.key, required this.parentId});

  final String parentId;

  ProductScreenModel readModel(BuildContext context) {
    return context.read<ProductScreenModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: readModel(context).getProductsOfCategory(parentId),
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              Widget body = const SizedBox.shrink();
              var data = snapshot.data ?? [];
              if (snapshot.hasData) {
                body = GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      discount: data[index].discount,
                      price: data[index].price,
                      image: data[index].image,
                      name: data[index].name,
                      id: data[index].id,
                      count: data[index].count,
                      color: Colors.white,
                      isSeasonal: data[index].isSeasonal,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                );
              } else if (snapshot.hasError) {
                body = const Text("We do not have any products now.");
              } else {
                body = const CircularProgressIndicator(
                    color: AppColors.darkThemeBacgroundColor);
              }
              return body;
            },
          )),
    );
  }
}
