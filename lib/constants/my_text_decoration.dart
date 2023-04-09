// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/providers/dark_theme_provider.dart';
import 'app_colors.dart';
import 'consts.dart';

class MyTextDecoration {
  static TextStyle titleTextStyle(BuildContext context) {
    final screenWidth = Consts.screenSize(context).width;

    final isDark = Provider.of<DarkThemeProvider>(context).getDarkTheme;
    return TextStyle(
        fontSize: screenWidth * 0.06,
        fontWeight: FontWeight.w700,
        color: !isDark ? Colors.white : AppColors.darkThemeBacgroundColor);
  }
}
