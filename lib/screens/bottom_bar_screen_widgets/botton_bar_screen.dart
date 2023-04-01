import 'package:flutter/material.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/buy_screen_widgets/buy_screen.dart';
import 'package:new_project/screens/categories_screen_widgets/categories_screen.dart';
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
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": const BuyScreen(), "title": "Order"},
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
    super.dispose();
    _animationController.dispose();
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: (() {}),
                  icon: Icon(
                    Icons.favorite,
                    color: isDark
                        ? Colors.white
                        : AppColors.darkThemeBacgroundColor,
                  )),
            )
          ],
          backgroundColor:
              isDark ? AppColors.darkThemeBacgroundColor : Colors.white,
          title: Text(
            _pages[_selectedIndex]["title"],
            style: MyTextDecoration.titleTextStyle(isDark),
          ),
          centerTitle: true,
        ),
        floatingActionButton: isDark
            ? MoonButton(animation: _animation)
            : SunButton(animation: _animation),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        body: _pages[_selectedIndex]["page"],
        bottomNavigationBar: BottomNavBar(
            selectScreen: _selectScreen, selectedIndex: _selectedIndex));
  }
}
