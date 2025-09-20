import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.productImage,
  });
  final String productName;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 108,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          // First shadow: 0px 6.54px 19.61px 0px #EEEEEE59
          BoxShadow(
            color: Color(0x59EEEEEE), // #EEEEEE59
            offset: Offset(0, 6.54),
            blurRadius: 19.61,
            spreadRadius: 0,
          ),
          // Second shadow: 0px 3.27px 6.54px 0px #42474C0F
          BoxShadow(
            color: Color(0x0F42474C), // #42474C0F
            offset: Offset(0, 3.27),
            blurRadius: 6.54,
            spreadRadius: 0,
          ),
          // Third shadow: 0px 0px 0.82px 0px #42474C52
          BoxShadow(
            color: Color(0x5242474C), // #42474C52
            offset: Offset(0, 0),
            blurRadius: 0.82,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
            child: Image.asset(productImage),
          ),
          SizedBox(height: 16),
          Text(
            productName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
