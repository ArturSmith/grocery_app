import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/models/favorites_screen_model.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/strings.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.discount,
      required this.count,
      this.color,
      required this.isSeasonal});

  final String name, image, id;
  final int discount, count, price;
  final Color? color;
  final bool isSeasonal;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isIn = false;

  onTapFavorite(BuildContext context) {
    setState(() {
      isIn = !isIn;
    });
    context.read<FavoritesScreenModel>().addProduct(widget.id);
  }

  setBool() {
    final box = Hive.box(Str.BOX_OF_PRODUCTS_ID);
    if (box.containsKey(widget.id)) {
      setState(() {
        isIn = true;
      });
    } else {
      setState(() {
        isIn = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setBool();
  }

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
            border: Border.all(color: widget.color ?? Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Flexible(
                child: widget.discount <= 1
                    ? FittedBox(
                        child: Text(
                          "Price - ${widget.price.toStringAsFixed(1)}",
                          style: TextStyle(
                              fontSize: screenSize * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      )
                    : DiscountPrice(
                        price: widget.price,
                        discount: widget.discount,
                      )),
            Flexible(
              flex: 3,
              child: FittedBox(
                child: SvgPicture.asset(
                  widget.image,
                  height: screenSize * 0.25,
                  width: screenSize * 0.25,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: AppColors.darkThemeBacgroundColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: IconButton(
                        onPressed: (() {
                          onTapFavorite(context);
                        }),
                        icon: isIn
                            ? const Icon(
                                IconlyLight.delete,
                                color: Colors.amber,
                              )
                            : const Icon(
                                IconlyLight.heart,
                              )),
                  ),
                  Flexible(
                    child: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(
                          IconlyLight.buy,
                        )),
                  ),
                ],
              ),
            ),
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
                color: Colors.black,
                decoration: TextDecoration.lineThrough,
                fontSize: screenSize * 0.04),
          ),
          TextSpan(
              text: '  ${getNewPrice()}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: screenSize * 0.05,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
