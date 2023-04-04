import 'package:flutter/cupertino.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Consts {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static isDark(BuildContext context) {
    return Provider.of<DarkThemeProvider>(context).getDarkTheme;
  }
}
