import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class HomeScreenProductCard extends StatelessWidget {
  const HomeScreenProductCard(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      this.discount});

  final String name;
  final String image;
  final String price;
  final String? discount;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Card(
      elevation: 10,
      child: Container(
        width: screenSize,
        height: screenSize * 0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.darkThemeBacgroundColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: (() {}), icon: const Icon(IconlyLight.heart)),
                  const SizedBox(height: 15),
                  IconButton(
                      onPressed: (() {}), icon: const Icon(IconlyLight.buy)),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: SvgPicture.asset(
                image,
                height: screenSize * 0.25,
                width: screenSize * 0.25,
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                name,
                style: const TextStyle(
                  color: AppColors.darkThemeBacgroundColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                'Price - $price',
                style: const TextStyle(
                  color: AppColors.darkThemeBacgroundColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                'Discount - $discount%',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
