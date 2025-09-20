import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';

class KColorBox extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const KColorBox({super.key, required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.84,
      width: 41.84,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: isSelected ? AppColors.green300 : AppColors.whiteColor,
          width: isSelected ? 4 : 2,
        ),
      ),
    );
  }
}
