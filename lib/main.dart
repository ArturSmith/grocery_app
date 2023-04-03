import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/models/buy_screen_model.dart';
import 'package:new_project/models/categories_screen_model.dart';
import 'package:new_project/models/home_screen_model.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/bottom_bar_screen_widgets/botton_bar_screen.dart';
import 'package:provider/provider.dart';
import 'constants/routes.dart';
import 'firebase_options.dart';
import 'models/main_model.dart';
import 'models/products_screen_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();
  MainModel mainModel = MainModel();

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
        ChangeNotifierProvider(
          create: (_) => CategoriesScreenModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductScreenModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeScreenModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => BuyScreenModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainModel(),
        ),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeStyles.themeData(themeProvider.getDarkTheme, context),
            routes: Routes.routes,
            initialRoute: "/Home",
            home: const BottomBarScreen());
      }),
    );
  }
}
