// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:new_project/constants/consts.dart';
import 'package:new_project/entities/product.dart';
import 'package:new_project/screens/products_screen_widgets/products_screen.dart';

class CategoryCardWidget extends StatelessWidget {
  CategoryCardWidget(
      {super.key,
      required this.categoryName,
      required this.image,
      required this.id,
      required this.products});
  final String categoryName, image, id;
  final List<Product> products;

  void onTap(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: ((_, __, ___) => ProductsScreen(parentId: id)),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  final randomColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());

  @override
  Widget build(BuildContext context) {
    final screenWidth = Consts.screenSize(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (() {
              onTap(context);
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
                image,
                width: screenWidth * 0.35,
                height: screenWidth * 0.35,
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
                categoryName,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: screenWidth * 0.05,
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
