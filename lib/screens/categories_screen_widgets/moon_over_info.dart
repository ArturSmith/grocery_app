import 'package:flutter/material.dart';
import 'package:new_project/constants/app_colors.dart';

class Moon extends StatelessWidget {
  const Moon({super.key});

  @override
  Widget build(BuildContext context) {
    const double moonSize = 30;
    const double starSize = moonSize * 0.3;
    return Hero(
      tag: 'moonButton',
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
            child: const Center(
                child: Icon(
              Icons.star,
              size: starSize,
              color: Colors.white,
            )),
          ),
        ],
      ),
    );
  }
}
