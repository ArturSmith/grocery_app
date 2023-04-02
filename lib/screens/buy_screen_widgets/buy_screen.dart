import 'package:flutter/material.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/models/buy_screen_model.dart';
import 'package:new_project/screens/buy_screen_widgets/product_order_card.dart';
import 'package:provider/provider.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  BuyScreenModel readModel(BuildContext context) {
    return Provider.of<BuyScreenModel>(context, listen: false);
  }

  BuyScreenModel watchModel(BuildContext context) {
    return Provider.of<BuyScreenModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    final products = readModel(context).products;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: products.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductOrderCard(
                  name: products[index].name,
                  id: products[index].id,
                  price: products[index].price,
                  discount: products[index].discount,
                  count: products[index].count,
                  image: products[index].image,
                );
              },
            )
          : Center(
              child: Text("You don't have any products in basket",
                  textAlign: TextAlign.center,
                  style: MyTextDecoration.titleTextStyle(context)),
            ),
    );
  }
}
