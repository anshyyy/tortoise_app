import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'inner_shadow_decoration.dart';

class CompanyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String title;
  final bool isSelected;

  const CompanyButton({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 76,
        width: 76,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.grayColor,
          borderRadius: BorderRadius.circular(10),
          // Border for selected items only
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        foregroundDecoration: !isSelected
            ? InnerShadowBoxDecoration(
                borderRadius: BorderRadius.circular(10),
                innerBoxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              )
            : null,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 24),
              SizedBox(height: 8),
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: AppColors.blackColor,
                  letterSpacing: 0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
