import 'package:flutter/material.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/services/dark_theme_prefs.dart';
import 'package:provider/provider.dart';

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

  static setColor(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final isDark = provider.getDarkTheme;
    return isDark ? Colors.white : AppColors.darkThemeBacgroundColor;
  }
}
