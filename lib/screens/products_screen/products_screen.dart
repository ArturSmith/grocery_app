import 'package:flutter/material.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/categories_screen_widgets/sun_over_info.dart';
import 'package:provider/provider.dart';
import '../categories_screen_widgets/moon_over_info.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final isDark = provider.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: ThemeStyles.setColor(context, true)),
          onPressed: (() {
            Navigator.of(context).pop();
          }),
        ),
        backgroundColor: ThemeStyles.setColor(context, false),
        title: isDark ? const Moon() : const Sun(),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
