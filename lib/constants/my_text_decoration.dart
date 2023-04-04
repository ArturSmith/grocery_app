import 'package:flutter/material.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart';

class MyTextDecoration {
  static TextStyle titleTextStyle(BuildContext context) {
    final isDark = Provider.of<DarkThemeProvider>(context).getDarkTheme;
    return TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: !isDark ? Colors.white : AppColors.darkThemeBacgroundColor);
  }
}
