import 'package:flutter/material.dart';

class SunButton extends StatefulWidget {
  const SunButton({super.key, this.onTap, required this.animation});
  final Function? onTap;
  final Animation<double> animation;

  @override
  State<SunButton> createState() => _SunButtonState();
}

class _SunButtonState extends State<SunButton> with TickerProviderStateMixin {
  final double size = 40;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: widget.animation,
      child: GestureDetector(
        onTap: () => widget.onTap,
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
