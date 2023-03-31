import 'package:flutter/material.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget(
      {super.key, required this.categoryName, required this.color});
  final String categoryName;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final _isDarkTheme = Provider.of<DarkThemeProvider>(context).getDarkTheme;
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: _isDarkTheme
            ? Colors.white.withOpacity(0.8)
            : color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: _isDarkTheme ? Colors.transparent : color.withOpacity(0.4),
            width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            categoryName,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          )
        ],
      ),
    );
  }
}
