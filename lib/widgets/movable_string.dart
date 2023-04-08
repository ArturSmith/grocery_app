import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:new_project/constants/consts.dart';

class MovableString extends StatelessWidget {
  const MovableString({super.key, required this.text, required this.color});

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final screenWidth = Consts.screenSize(context).width;
    return Container(
      width: screenWidth,
      height: screenWidth * 0.1,
      decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: const BorderSide(color: Colors.transparent),
            horizontal: BorderSide(color: color, width: 3),
          ),
          color: color),
      child: Marquee(
        textDirection: TextDirection.rtl,
        blankSpace: 70,
        text: text,
        style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
