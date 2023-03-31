import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../providers/dark_theme_provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar(
      {super.key, required this.selectScreen, required this.selectedIndex});
  int selectedIndex;
  final Function(int)? selectScreen;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    final bool _dark = provider.getDarkTheme;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: _dark ? Colors.white : Colors.black,
          unselectedItemColor: _dark ? Colors.grey : Colors.white,
          selectedItemColor: _dark ? Colors.amber : Colors.amber,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: selectScreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(selectedIndex == 0
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(
                  selectedIndex == 1 ? IconlyBold.profile : IconlyLight.profile,
                ),
                label: "User"),
            BottomNavigationBarItem(
                icon:
                    Icon(selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                label: "Buy"),
            BottomNavigationBarItem(
                icon: Icon(selectedIndex == 3
                    ? IconlyBold.setting
                    : IconlyLight.setting),
                label: "Setting"),
          ],
        ),
      ),
    );
  }
}
