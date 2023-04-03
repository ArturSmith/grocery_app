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

  HomeScreenModel watchModel(BuildContext context) {
    return context.watch<HomeScreenModel>();
  }

  @override
  Widget build(BuildContext context) {
    watchModel(context).getProductsWithDiscount(context);
    return FutureBuilder(
        future: readModel(context).products,
        builder: ((context, AsyncSnapshot<List<Product>> snapshot) {
          Widget body = const SizedBox.shrink();
          if (snapshot.hasData) {
            final list = snapshot.data as List<Product>;
            body = Body(list: list);
          } else {
            body = Center(
              child: CircularProgressIndicator(
                color: ThemeStyles.setColor(
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

class Body extends StatelessWidget {
  const Body({super.key, required this.list});
  final List<Product> list;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        MySwiper(),
        const MovableString(
          text: "BEST PRICE",
          color: Colors.red,
        ),
        HomeScreenBestPriceGridView(products: list),
        const MovableString(text: 'SEASONAL  PRODUCTS', color: Colors.green)
      ],
    );
  }
}
