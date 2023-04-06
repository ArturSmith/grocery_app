import 'package:flutter/material.dart';
import 'package:new_project/models/home_screen_model.dart';
import 'package:new_project/entitis/product.dart';
import 'package:provider/provider.dart';
import '../../constants/theme_style.dart';
import '../../widgets/best_price_string.dart';
import 'home_screen_best_price_grid_view.dart';
import '../../widgets/my_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  HomeScreenModel readModel(BuildContext context) {
    return context.read<HomeScreenModel>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readModel(context).getProdsWithDiscount(),
        builder: ((context, AsyncSnapshot<List<Product>> snapshot) {
          Widget body = const SizedBox.shrink();
          if (snapshot.hasData) {
            final list = snapshot.data as List<Product>;
            body = _Body(listOfProducts: list);
          } else {
            body = Center(
              child: CircularProgressIndicator(
                color: ThemeStyles.setThemeColor(
                  context,
                  true,
                ),
              ),
            );
          }
          return body;
        }));
  }
}

class _Body extends StatelessWidget {
  _Body({super.key, required this.listOfProducts});
  final List<Product> listOfProducts;
  final List<String> images = [
    'lib/assets/shop_pics/pexels-anna-shvets-3962285.jpg',
    'lib/assets/shop_pics/pexels-erik-scheel-95425.jpg',
    'lib/assets/shop_pics/pexels-matheus-cenali-2733918.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        MySwiper(lisOfImages: images),
        const MovableString(
          text: "BEST PRICE",
          color: Colors.red,
        ),
        HomeScreenBestPriceGridView(products: listOfProducts),
        const MovableString(text: 'SEASONAL  PRODUCTS', color: Colors.green)
      ],
    );
  }
}
