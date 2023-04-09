// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/providers/dark_theme_provider.dart';

class Consts {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static isDark(BuildContext context) {
    return Provider.of<DarkThemeProvider>(context).getDarkTheme;
  }

  static navigate(
      Widget screen, BuildContext context, int duration, bool replace) {
    replace
        ? Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: ((_, __, ___) => screen),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          )
        : Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: ((_, __, ___) => screen),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          );
  }
}
