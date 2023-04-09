// Flutter imports:
import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});
  final double size = 30;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'sunButton',
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
