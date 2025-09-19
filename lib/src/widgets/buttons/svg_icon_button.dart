import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  const SvgIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = const Color(0xffe1e1e1),
    this.iconColor = const Color(0xffFFFFFF),
    this.height = 24,
    this.width = 24,
    this.borderRadius = 50,
  });

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
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              iconColor ?? Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
