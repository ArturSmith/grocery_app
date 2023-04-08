import 'package:flutter/material.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/constants/theme_style.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/bascet_screen_widgets/bascet_screen.dart';
import 'package:new_project/screens/categories_screen_widgets/categories_screen.dart';
import 'package:new_project/screens/favorites_screen_widgets/favorites_screen.dart';
import 'package:new_project/screens/user_screen_widgets/user_screen.dart';
import 'package:new_project/screens/home_screen_widgets/home_screen.dart';
import 'package:provider/provider.dart';
import '../../widgets/moon_button.dart';
import '../../widgets/sun_button.dart';
import 'bottom_nav_bar.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {"page": const HomeScreen(), "title": "Home"},
    {"page": const CategoriesScreen(), "title": "Categories"},
    {"page": const BascetScreen(), "title": "Order"},
    {"page": const UserScreen(), "title": "User settings"}
  ];

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
      repeatAnimationOnce();
    });
  }

  void repeatAnimationOnce() async {
    await _animationController.forward();
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final bool isDark = provider.getDarkTheme;
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          flexibleSpace: isDark
              ? null
              : Container(
                  decoration:
                      const BoxDecoration(gradient: ThemeStyles.gradient),
                ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: (() {
                    Consts.navigate(const FavoritesScreen(), context);
                  }),
                  icon: Icon(Icons.favorite,
                      color: ThemeStyles.setThemeColor(context, false))),
            )
          ],
          backgroundColor: ThemeStyles.setThemeColor(context, true),
          title: Text(
            _pages[_selectedIndex]["title"],
            style: MyTextDecoration.titleTextStyle(context),
          ),
          centerTitle: true,
        ),
        floatingActionButton: isDark
            ? MoonButton(animation: _animation)
            : SunButton(animation: _animation, size: 40),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        body: _pages[_selectedIndex]["page"],
        bottomNavigationBar: BottomNavBar(
            selectScreen: _selectScreen, selectedIndex: _selectedIndex));
  }
}
