import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/entitis/product.dart';
import 'package:new_project/screens/products_screen_widgets/products_screen.dart';
import 'dart:math' as math;

class CategoryCardWidget extends StatefulWidget {
  const CategoryCardWidget(
      {super.key,
      required this.categoryName,
      required this.image,
      required this.id,
      required this.products});
  final String categoryName, image, id;
  final List<Product> products;

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

  void onTap() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: ((_, __, ___) => ProductsScreen(parentId: widget.id)),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  final randomColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());

  @override
  Widget build(BuildContext context) {
    final width = Consts.screenSize(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ScaleTransition(
        scale: _animation,
        child: Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: (() {
                onTap();
              }),
              child: Container(
                margin: const EdgeInsets.only(bottom: 13),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Consts.isDark(context)
                      ? Colors.white.withOpacity(0.8)
                      : randomColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Consts.isDark(context)
                          ? Colors.transparent
                          : randomColor.withOpacity(0.4),
                      width: 2),
                ),
                child: SvgPicture.asset(
                  widget.image,
                  width: width * 0.35,
                  height: width * 0.35,
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
      ),
    );
  }
}
