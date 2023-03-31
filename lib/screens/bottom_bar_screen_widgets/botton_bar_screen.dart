import 'package:flutter/material.dart';
import 'package:new_project/screens/buy_screen.dart';
import 'package:new_project/screens/categories_screen.dart';
import 'package:new_project/screens/settings_screen.dart';
import 'package:new_project/screens/user_screen.dart';
import 'bottom_nav_bar.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    CategoriesScreen(),
    UserScreen(),
    BuyScreen(),
    SettingsScreen(),
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
    return Scaffold(
        floatingActionButton: RotationTransition(
          turns: _animation,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.amber,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavBar(
            selectScreen: _selectScreen, selectedIndex: _selectedIndex));
  }
}
