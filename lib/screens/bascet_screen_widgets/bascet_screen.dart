import 'package:flutter/material.dart';
import 'package:new_project/constants/my_text_decoration.dart';
import 'package:new_project/models/bascet_screen_model.dart';
import 'package:provider/provider.dart';

class BascetScreen extends StatelessWidget {
  const BascetScreen({super.key});

  BascetScreenModel readModel(BuildContext context) {
    return context.read<BascetScreenModel>();
  }

  BascetScreenModel watchModel(BuildContext context) {
    return context.watch<BascetScreenModel>();
  }

  @override
  Widget build(BuildContext context) {
    final cards = readModel(context).cards;
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: cards.isEmpty
              ? Text("You don't have any products in basket",
                  textAlign: TextAlign.center,
                  style: MyTextDecoration.titleTextStyle(context))
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cards[index];
                  },
                )),
    );
  }
}
