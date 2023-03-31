import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/buy_screen.dart';
import 'package:new_project/screens/categories_screen.dart';
import 'package:new_project/screens/settings_screen.dart';
import 'package:new_project/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../../widgets/moon_botton.dart';
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

  final List<Map<String, dynamic>> _pages = const [
    {"page": HomeScreen(), "title": "Home"},
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": BuyScreen(), "title": "Order grocery"},
    {"page": SettingsScreen(), "title": "Settings"}
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
          backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
          title: Text(
            _pages[_selectedIndex]["title"],
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : Colors.black),
          ),
          centerTitle: true,
        ),
        floatingActionButton: RotationTransition(
            turns: _animation,
            child: isDark ? const MoonButton() : const SunButton()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        body: _pages[_selectedIndex]["page"],
        bottomNavigationBar: BottomNavBar(
            selectScreen: _selectScreen, selectedIndex: _selectedIndex));
  }
}
