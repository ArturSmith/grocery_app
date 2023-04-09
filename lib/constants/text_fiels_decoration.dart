// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/consts.dart';

class TextFieldDecoration {
  static InputDecoration decoration(
      BuildContext context, String label, String? errorText) {
    final borderRadius = BorderRadius.circular(30);
    final isDark = Consts.isDark(context);
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      isCollapsed: true,
      contentPadding: const EdgeInsets.all(15),
      errorText: errorText,
      labelText: label,
      labelStyle: const TextStyle(color: AppColors.darkThemeBacgroundColor),
      floatingLabelStyle:
          TextStyle(color: isDark ? Colors.white : Colors.black),
      floatingLabelBehavior:
          isDark ? FloatingLabelBehavior.never : FloatingLabelBehavior.auto,
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
            width: 2,
            color: isDark ? Colors.white : AppColors.darkThemeBacgroundColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: isDark ? Colors.white : Colors.amber,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    );
  }
}
