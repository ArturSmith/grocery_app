import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class ProductOrderCard extends StatelessWidget {
  const ProductOrderCard(
      {super.key,
      required this.name,
      required this.id,
      required this.price,
      this.discount,
      required this.image,
      required this.count});

  final String name, id, image;
  final int count, price;
  final int? discount;

  getTotalPrice() {
    final totPri = count * price;
    final sale = discount != null ? discount! / 100 : 1;
    return totPri * sale;
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      image,
                      height: screenSize * 0.20,
                      width: screenSize * 0.20,
                    ),
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.darkThemeBacgroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Count - $count',
                    style: const TextStyle(
                      color: AppColors.darkThemeBacgroundColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Price - $price',
                    style: const TextStyle(
                      color: AppColors.darkThemeBacgroundColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Visibility(
                    visible: discount != null ? true : false,
                    child: Text(
                      'Discount - $discount%',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'Total price - ${getTotalPrice()}',
                    style: const TextStyle(
                      color: AppColors.darkThemeBacgroundColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: (() {}),
                        icon: const Icon(IconlyLight.delete)),
                    IconButton(
                        onPressed: (() {}), icon: const Icon(IconlyLight.edit)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
