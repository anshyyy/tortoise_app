import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';

class KPrimaryButton extends StatelessWidget {
  const KPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 56,
    this.width,
    this.borderRadius,
    this.backgroundColor = AppColors.blackColor,
    this.textColor = AppColors.whiteColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor ;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
        ),
      ),
    );
  }
}
