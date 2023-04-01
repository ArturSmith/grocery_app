import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyTextDecoration {
  static TextStyle titleTextStyle(bool isDark) => TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: isDark ? Colors.white : AppColors.darkThemeBacgroundColor);
}
