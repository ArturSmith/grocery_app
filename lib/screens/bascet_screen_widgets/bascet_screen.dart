import 'package:flutter/material.dart';
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
    return const Center(
        child: FittedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Text("Please sign in to see your bascet",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700)),
      ),
    ));
  }
}
