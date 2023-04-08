import 'package:flutter/cupertino.dart';
import 'package:new_project/constants/strings.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/bottom_bar_screen_widgets/botton_bar_screen.dart';
import 'package:provider/provider.dart';

class Consts {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static isDark(BuildContext context) {
    return Provider.of<DarkThemeProvider>(context).getDarkTheme;
  }

  static navigate(Widget screen, BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: ((_, __, ___) => screen),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }
}
