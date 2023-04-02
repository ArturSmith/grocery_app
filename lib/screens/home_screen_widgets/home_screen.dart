import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/theme_style.dart';
import '../../models/home_screen_model.dart';
import '../../widgets/best_price_string.dart';
import 'home_screen_best_price_grid_view.dart';
import '../../widgets/my_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<Map<String, String>>> getProductsWithDiscount(
      BuildContext context) {
    final model = Provider.of<HomeScreenModel>(context);

    return model.getProductsWithDiscount(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProductsWithDiscount(context),
        builder: ((context, AsyncSnapshot<List<Map<String, String>>> snapshot) {
          Widget body = const SizedBox.shrink();
          if (snapshot.hasData) {
            final list = snapshot.data as List<Map<String, String>>;
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
  final List<Map<String, String>> list;
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
        HomeScreenBestPriceGridView(data: list),
        const MovableString(text: 'SEASONAL  PRODUCTS', color: Colors.green)
      ],
    );
  }
}
