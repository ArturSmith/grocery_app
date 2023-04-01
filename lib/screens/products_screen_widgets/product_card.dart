import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/constants/my_text_decoration.dart';

import '../../constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.image, required this.name});
  final String image;
  final String name;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              image,
              height: screenSize * 0.25,
              width: screenSize * 0.25,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(
                color: AppColors.darkThemeBacgroundColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (() {}), icon: const Icon(IconlyLight.heart)),
                const SizedBox(height: 15),
                IconButton(
                    onPressed: (() {}), icon: const Icon(IconlyLight.buy)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
