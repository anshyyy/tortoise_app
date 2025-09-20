import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';
import 'package:tortoise/src/utils/extension/extension.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({
    super.key,
    required this.price,
    required this.effectivePrice,
    required this.monthlyDeduction,
    required this.isEffective,
    this.height = 90,
    this.onTap,
  });
  final double price;
  final double effectivePrice;
  final double monthlyDeduction;
  final bool isEffective;
  final double height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Create gradient border effect
    Widget content = Container(
      padding: const EdgeInsets.all(12),
      height: height,
      decoration: BoxDecoration(
        color: AppColors.gray500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isEffective ? 'EFFECTIVE PRICE' : 'DEVICE PRICE',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black500,
                  letterSpacing: 0.8,
                ),
              ),
              if (isEffective)
                SvgPicture.asset(
                  AssetConstants.caretRightIcon,
                  width: 13,
                  height: 13,
                ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            '₹${(isEffective ? effectivePrice : price).toIndianCurrency()}',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isEffective ? AppColors.green300 : AppColors.black500,
            ),
          ),
          Text(
            !isEffective
                ? 'Monthly Deduction ₹${monthlyDeduction.toIndianCurrency()}'
                : 'See impact in net salary',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: isEffective ? 12 : 11,
              fontWeight: FontWeight.w500,
              color: isEffective ? AppColors.green300 : AppColors.black400,
            ),
          ),
        ],
      ),
    );

    // Apply gradient border only for effective price
    if (isEffective) {
      return GestureDetector(
        onTap: isEffective ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF5AE0A8), // 5% lighter shade of #42D499
                Color(0xFF42D499), // #42D499 - Original Green
                Color(0xFF5AE0A8), // 5% lighter shade of #42D499
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(2), // 2px border width for better visibility
            decoration: BoxDecoration(
              color: AppColors.gray500,
              borderRadius: BorderRadius.circular(10),
            ),
            child: content,
          ),
        ),
      );
    }

    return content;
  }
}
