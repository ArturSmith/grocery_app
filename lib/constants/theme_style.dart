// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/providers/dark_theme_provider.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.darkThemeBacgroundColor
          : const Color(0xFFFFFFFF),
      cardColor: isDarkTheme
          ? AppColors.darkThemeBacgroundColor
          : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }

  static setThemeColor(BuildContext context, bool whiteWhenDark) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final isDark = provider.getDarkTheme;
    Color textAndIcons =
        isDark ? Colors.white : AppColors.darkThemeBacgroundColor;
    Color background =
        isDark ? AppColors.darkThemeBacgroundColor : Colors.white;
    return whiteWhenDark ? textAndIcons : background;
  }

  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color(0xff1f005c),
      Color(0xff5b0060),
      Color(0xff870160),
      Color(0xffac255e),
      Color(0xffca485c),
      Color(0xffe16b5c),
      Color(0xfff39060),
      Color(0xffffb56b),
    ], // Gradient from https://learnui.design/tools/gradient-generator.html
    tileMode: TileMode.mirror,
  );
}
