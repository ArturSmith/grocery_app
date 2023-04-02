import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MovableString extends StatelessWidget {
  const MovableString({super.key, required this.text, required this.color});

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Container(
        width: size,
        height: size * 0.1,
        decoration: BoxDecoration(
            border: Border.symmetric(
              vertical: const BorderSide(color: Colors.transparent),
              horizontal: BorderSide(color: color, width: 3),
            ),
            color: Colors.white),
        child: Marquee(
          blankSpace: 70,
          text: text,
          style: TextStyle(
              color: color, fontSize: 25, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
