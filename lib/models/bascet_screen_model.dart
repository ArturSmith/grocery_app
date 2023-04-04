import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/bascet_screen_widgets/bascet_screen_card_widget.dart';

import '../entitis/product.dart';

class BascetScreenModel extends ChangeNotifier {
  List<Product> _products = [];
  List<BascetScreenCardWidget> cards = [];

  addProduct(String name, id, image, int price, int? discount) {
    final product = Product(name, image, id, price, discount, null);
    _products.add(product);

    final card = BascetScreenCardWidget(
        name: product.name,
        image: product.image,
        id: product.id,
        price: product.price,
        quantity: 1);

    if (cards.isEmpty) {
      cards.add(card);
    } else {
      for (var element in cards) {
        if (element.id == id) {
          element.quantity++;
        } else {
          cards.add(card);
        }
      }
    }

    notifyListeners();
  }

  removeProduct(String id) {
    _products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  makeOrder() {}
}
