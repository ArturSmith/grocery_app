// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_colors.dart';
import 'consts.dart';

class ButtonsDecoration {
  static buttonDecor(double screenWidth, BuildContext context) => ButtonStyle(
      overlayColor: MaterialStatePropertyAll(
          Consts.isDark(context) ? Colors.white : Colors.amber),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      elevation: const MaterialStatePropertyAll(10),
      minimumSize:
          MaterialStatePropertyAll(Size(screenWidth * 0.3, screenWidth * 0.1)),
      foregroundColor:
          const MaterialStatePropertyAll(AppColors.darkThemeBacgroundColor));
}
