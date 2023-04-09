// Flutter imports:
import 'package:flutter/material.dart';

class SunButton extends StatelessWidget {
  const SunButton(
      {super.key,
      this.onTap,
      required this.animation,
      required this.size,
      required this.color});
  final Function? onTap;
  final Animation<double> animation;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: GestureDetector(
        onTap: () => onTap,
        child: Hero(
          tag: 'sunButton',
          child: Stack(children: [
            Transform.rotate(
              angle: 1,
              child: Container(
                color: color,
                width: size,
                height: size,
              ),
            ),
            Transform.rotate(
              angle: 2,
              child: Container(
                color: color,
                width: size,
                height: size,
              ),
            ),
            Transform.rotate(
              angle: 3,
              child: Container(
                color: color,
                width: size,
                height: size,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
