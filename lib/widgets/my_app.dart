// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/api/api.dart';
import 'package:new_project/models/bascet_screen_model.dart';
import 'package:new_project/models/categories_screen_model.dart';
import 'package:new_project/models/longin_screen_model.dart';
import 'package:new_project/models/products_screen_model.dart';
import '../constants/routes.dart';
import '../constants/strings.dart';
import '../constants/theme_style.dart';
import '../models/favorites_screen_model.dart';
import '../models/home_screen_model.dart';
import '../providers/dark_theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  void getCurrentTheme() async {
    themeProvider.setDarkTheme =
        await themeProvider.darkThemePrefs.getDarkTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesScreenModel()),
        ChangeNotifierProvider(create: (_) => ProductScreenModel()),
        ChangeNotifierProvider(create: (_) => HomeScreenModel()),
        ChangeNotifierProvider(create: (_) => BascetScreenModel()),
        ChangeNotifierProvider(create: (_) => FavoritesScreenModel()),
        ChangeNotifierProvider(create: (_) => LoginScreenModel()),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeStyles.themeData(themeProvider.getDarkTheme, context),
          routes: Routes.routes,
          initialRoute: Str.FIRST_SCREEN,
        );
      }),
    );
  }
}
