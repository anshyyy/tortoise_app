import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';
import 'package:tortoise/src/utils/extension/extension.dart';
import 'package:tortoise/src/widgets/buttons/primary_button.dart';
import 'package:tortoise/src/widgets/misc/dotted_divider.dart';

class EffectivePriceSheet extends StatelessWidget {
  const EffectivePriceSheet({
    super.key,
    required this.taxSlab,
    required this.effectivePrice,
    required this.monthlyDeduction,
  });
  final String taxSlab;
  final double effectivePrice;
  final double monthlyDeduction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'EFFECTIVE PRICE',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.black500.withValues(alpha: 0.25),
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'The effective price is the device’s cost after savings, based on your payroll structure',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black600,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 6.54),
                  blurRadius: 19.61,
                  color: Color(0x59EEEEEE),
                ),
                BoxShadow(
                  offset: Offset(0, 3.27),
                  blurRadius: 6.54,
                  color: Color(0x0F42474C),
                ),
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 0.82,
                  color: Color(0x5242474C),
                ),
              ],

              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax slab',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${taxSlab}%',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black600,
                          ),
                        ),
                        SizedBox(width: 8),
                        SvgPicture.asset(AssetConstants.downArrowIcon),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                DottedDivider(
                  color: AppColors.dividerColor,
                  thickness: 1.0,
                  dashPattern: [4, 4],
                  padding: EdgeInsets.zero,
                ),
                SizedBox(height: 16),
                EffectivePriceItem(
                  title: 'Effective Price',
                  value: '₹${effectivePrice.toIndianCurrency()}',
                  description: 'Price calculation based on selected tax slab',
                  titleColor: AppColors.green300,
                  valueColor: AppColors.green300,
                ),
                SizedBox(height: 16),
                DottedDivider(
                  color: AppColors.dividerColor,
                  thickness: 1.0,
                  dashPattern: [4, 4],
                  padding: EdgeInsets.zero,
                ),
                SizedBox(height: 16),
                EffectivePriceItem(
                  title: 'Impact in monthly in-hand',
                  value: '₹${monthlyDeduction.toIndianCurrency()}',
                  description:
                      'You monthly in-hand salary will be reduced by this amount',
                ),
                SizedBox(height: 8),
                Divider(color: AppColors.dividerColor),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Know more',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.green300,
                      ),
                    ),
                    SvgPicture.asset(AssetConstants.downArrowIcon),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          KPrimaryButton(
            onPressed: () {},
            text: 'Okay! got it',
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class EffectivePriceItem extends StatelessWidget {
  const EffectivePriceItem({
    super.key,
    required this.title,
    required this.value,
    required this.description,
    this.titleColor = AppColors.black600,
    this.valueColor = AppColors.black600,
  });
  final String title;
  final String value;
  final String description;
  final Color? titleColor;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: titleColor,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: valueColor,
                ),
              ),
            ],
          ),

          SizedBox(
            width: 204,
            child: Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black500.withValues(alpha: 0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
