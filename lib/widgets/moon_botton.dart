import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class MoonButton extends StatelessWidget {
  const MoonButton({super.key, this.onTap});
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    const double moonSize = 40;
    const double starSize = moonSize * 0.3;
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
            child: const Center(
                child: Icon(
              Icons.star,
              size: starSize,
            )),
          ),
        ],
      ),
    );
  }
}
