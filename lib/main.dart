import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/botton_bar_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
      providers: [ChangeNotifierProvider(create: (_) => DarkThemeProvider())],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeStyles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen());
      }),
    );
  }
}
