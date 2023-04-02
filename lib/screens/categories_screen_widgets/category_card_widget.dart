import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/providers/dark_theme_provider.dart';
import 'package:new_project/screens/products_screen_widgets/products_screen.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatefulWidget {
  const CategoryCardWidget(
      {super.key,
      required this.categoryName,
      required this.color,
      required this.image});
  final String categoryName, image;
  final Color color;

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.reverse();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isDarkTheme = Provider.of<DarkThemeProvider>(context).getDarkTheme;
    final size = MediaQuery.of(context).size.width;

    return ScaleTransition(
      scale: _animation,
      child: Stack(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (() {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: ((_, __, ___) =>
                      ProductsScreen(category: widget.categoryName)),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              );
            }),
            child: Container(
              margin: const EdgeInsets.only(bottom: 13),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _isDarkTheme
                    ? Colors.white.withOpacity(0.8)
                    : widget.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: _isDarkTheme
                        ? Colors.transparent
                        : widget.color.withOpacity(0.4),
                    width: 2),
              ),
              child: SvgPicture.asset(
                widget.image,
                width: size * 0.4,
                height: size * 0.4,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
              child: Text(
                widget.categoryName,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
