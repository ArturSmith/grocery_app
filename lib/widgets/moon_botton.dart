import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class MoonButton extends StatelessWidget {
  const MoonButton({super.key, this.onTap, required this.animation});
  final Function? onTap;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    const double moonSize = 40;
    const double starSize = moonSize * 0.6;
    return GestureDetector(
      onTap: () => onTap,
      child: Stack(
        children: [
          Container(
            width: moonSize,
            height: moonSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            width: moonSize * 0.85,
            height: moonSize * 0.85,
            decoration: BoxDecoration(
              color: AppColors.darkThemeBacgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
                child: AnimatedSize(
              duration: const Duration(seconds: 1),
              child: ScaleTransition(
                scale: animation,
                child: const Icon(
                  Icons.star,
                  size: starSize,
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
