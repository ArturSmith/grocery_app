import 'package:flutter/material.dart';

class SunButton extends StatelessWidget {
  const SunButton({super.key, this.onTap});
  final double size = 40;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
