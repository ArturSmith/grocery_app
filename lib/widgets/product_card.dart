import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/constants/consts.dart';
import '../constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.discount,
      required this.count,
      required this.color});

  final String name, image, id;
  final int discount, count, price;
  final Color color;

  onTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final screenSize = Consts.screenSize(context).width;
    return Card(
      elevation: 10,
      child: Container(
        width: screenSize,
        height: screenSize * 0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(IconlyLight.heart)),
                  ),
                  Flexible(
                    child: IconButton(
                        onPressed: (() {
                          onTap(context);
                        }),
                        icon: const Icon(
                          IconlyLight.buy,
                        )),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: FittedBox(
                child: SvgPicture.asset(
                  image,
                  height: screenSize * 0.25,
                  width: screenSize * 0.25,
                ),
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
                child: discount <= 1
                    ? Text(
                        "Price - ${price.toStringAsFixed(1)}",
                        style: TextStyle(fontSize: screenSize * 0.05),
                      )
                    : DiscountPrice(
                        price: price,
                        discount: discount,
                      )),
          ],
        ),
      ),
    );
  }
}

class DiscountPrice extends StatelessWidget {
  const DiscountPrice({super.key, required this.price, required this.discount});
  final int price;
  final int discount;
  getNewPrice() {
    final pacent = (discount / 100 * price);
    final newPrice = price - pacent;
    return newPrice.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = Consts.screenSize(context).width;

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: '$price ',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: screenSize * 0.04),
          ),
          TextSpan(
              text: '${getNewPrice()}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: screenSize * 0.05,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
