import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/entitis/product.dart';
import 'package:new_project/models/bascet_screen_model.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import 'dart:math' as math;

class HomeScreenProductCard extends StatelessWidget {
  const HomeScreenProductCard(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      this.discount,
      this.count,
      required this.id});

  final String name, image, id;
  final int price;
  final int? discount, count;

  BascetScreenModel readModel(BuildContext context) {
    return context.read<BascetScreenModel>();
  }

  BascetScreenModel watchModel(BuildContext context) {
    return context.watch<BascetScreenModel>();
  }

  onTap(BuildContext context) {
    readModel(context).addProduct(name, id, image, price, discount);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final randomColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());

    return Card(
      elevation: 10,
      child: Container(
        width: screenSize,
        height: screenSize * 0.3,
        decoration: BoxDecoration(
            color: randomColor.withOpacity(0.1),
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
                      onPressed: (() {
                        onTap(context);
                      }),
                      icon: const Icon(
                        IconlyLight.buy,
                      )),
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
