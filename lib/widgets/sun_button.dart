import 'package:flutter/material.dart';

class SunButton extends StatelessWidget {
  const SunButton({super.key, this.onTap, required this.animation});
  final double size = 40;
  final Function? onTap;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: GestureDetector(
        onTap: () => onTap,
        child: Stack(children: [
          Transform.rotate(
            angle: 1,
            child: Container(
              color: Colors.amber,
              width: size,
              height: size,
            ),
          ),
          Transform.rotate(
            angle: 2,
            child: Container(
              color: Colors.amber,
              width: size,
              height: size,
            ),
          ),
          Transform.rotate(
            angle: 3,
            child: Container(
              color: Colors.amber,
              width: size,
              height: size,
            ),
          ),
        ]),
      ),
    );
  }
}
