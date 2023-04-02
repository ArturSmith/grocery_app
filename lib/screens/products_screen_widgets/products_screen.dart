import 'package:flutter/material.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/products_screen_widgets/product_card.dart';
import 'package:new_project/screens/products_screen_widgets/sun_over_info.dart';
import 'package:provider/provider.dart';
import '../../models/products_screen_model.dart';
import 'moon_over_info.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.category});
  final String category;

  Future<List<Map<String, dynamic>>> getData(BuildContext context) {
    final model = Provider.of<ProductScreenModel>(context);
    return model.getData(category, context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final isDark = provider.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: (() {}),
                icon: Icon(
                  Icons.favorite,
                  color: ThemeStyles.setColor(context, false),
                )),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeStyles.setColor(context, false),
          ),
          onPressed: (() {
            Navigator.of(context).pop();
          }),
        ),
        backgroundColor: ThemeStyles.setColor(context, true),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: isDark ? const Moon() : const Sun(),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(context),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            Widget body = const SizedBox.shrink();
            if (snapshot.hasData) {
              body = Body(data: snapshot.data);
            } else if (snapshot.hasError) {
              body = Center(
                  child: Text("Error",
                      style: MyTextDecoration.titleTextStyle(context)));
            } else {
              body = Center(
                  child: CircularProgressIndicator(
                color: ThemeStyles.setColor(context, true),
              ));
            }
            return body;
          }),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              image: data[index]["image"],
              name: data[index]["name"],
            );
          },
        ),
      ),
    );
  }
}
