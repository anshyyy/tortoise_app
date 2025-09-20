import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';

class KTile extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final Widget? child;
  const KTile({
    super.key,
    this.height = 42,
    this.backgroundColor = AppColors.brown100,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: backgroundColor,
      child: Center(child: child),
    );
  }
}
