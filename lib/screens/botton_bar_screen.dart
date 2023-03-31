import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/buy_screen.dart';
import 'package:new_project/screens/categories_screen.dart';
import 'package:new_project/screens/settings_screen.dart';
import 'package:new_project/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    CategoriesScreen(),
    UserScreen(),
    BuyScreen(),
    SettingsScreen(),
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final bool _dark = provider.getDarkTheme;
    return SafeArea(
      child: Scaffold(
        extendBody: false,
        body: _pages[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: _dark ? Colors.white : Colors.black,
            unselectedItemColor: _dark ? Colors.grey : Colors.white,
            selectedItemColor: _dark ? Colors.amber : Colors.amber,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _selectScreen,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(_selectedIndex == 0
                      ? IconlyBold.category
                      : IconlyLight.category),
                  label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(
                    _selectedIndex == 1
                        ? IconlyBold.profile
                        : IconlyLight.profile,
                  ),
                  label: "User"),
              BottomNavigationBarItem(
                  icon: Icon(
                      _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                  label: "Buy"),
              BottomNavigationBarItem(
                  icon: Icon(_selectedIndex == 3
                      ? IconlyBold.setting
                      : IconlyLight.setting),
                  label: "Setting"),
            ],
          ),
        ),
      ),
    );
  }
}
