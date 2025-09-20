import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/widgets/buttons/primary_button.dart';
import 'package:tortoise/src/widgets/misc/price_box.dart';

class BottomNav extends StatelessWidget {
  final double totalPrice;

  final double effectivePrice;
  final double monthlyDeduction;
  final VoidCallback onAddToCart;
  final VoidCallback onEffectivePrice;

  const BottomNav({
    super.key,
    required this.totalPrice,
    required this.effectivePrice,
    required this.monthlyDeduction,
    required this.onAddToCart,
    required this.onEffectivePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          // First shadow: 0px -6.54px 19.61px 0px #EEEEEE59
          BoxShadow(
            offset: Offset(0, -6.54),
            blurRadius: 19.61,
            spreadRadius: 0,
            color: Color(0x59EEEEEE), // #EEEEEE59
          ),
          // Second shadow: 0px -3.27px 6.54px 0px #42474C0F
          BoxShadow(
            offset: Offset(0, -3.27),
            blurRadius: 6.54,
            spreadRadius: 0,
            color: Color(0x0F42474C), // #42474C0F
          ),
          // Third shadow: 0px 0px 0.82px 0px #42474C52
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 0.82,
            spreadRadius: 0,
            color: Color(0x5242474C), // #42474C52
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PriceBox(
                  price: totalPrice,
                  effectivePrice: effectivePrice,
                  monthlyDeduction: monthlyDeduction,
                  isEffective: false,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: PriceBox(
                  price: totalPrice,
                  effectivePrice: effectivePrice,
                  monthlyDeduction: monthlyDeduction,
                  isEffective: true,
                  onTap: onEffectivePrice,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          KPrimaryButton(text: 'Add to Cart', onPressed: onAddToCart),
        ],
      ),
    );
  }
}
