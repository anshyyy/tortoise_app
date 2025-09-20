import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';

class KSizeBox extends StatelessWidget {
  final double height;
  final double width;
  final bool isSelected;
  final String text;

  const KSizeBox({
    super.key,
    this.height = 52,
    this.width = 111,
    this.isSelected = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.green300 : AppColors.grayColor,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0A000000), // #0000000A
            offset: const Offset(0, 2),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            SizedBox(width: 8),
            SvgPicture.asset(
              isSelected
                  ? AssetConstants.checkIcon
                  : AssetConstants.uncheckedIcon,
            ),
          ],
        ),
      ),
    );
  }
}
