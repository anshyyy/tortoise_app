import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';
import 'package:tortoise/src/models/product_specification_model.dart';

class SpecificationsBox extends StatefulWidget {
  final List<ProductSpecificationModel> specifications;
  const SpecificationsBox({super.key, required this.specifications});

  @override
  State<SpecificationsBox> createState() => _SpecificationsBoxState();
}

class _SpecificationsBoxState extends State<SpecificationsBox> {
  bool _isExpanded = false;
  static const int _maxInitialItems = 5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasMoreItems = widget.specifications.length > _maxInitialItems;
    final itemsToShow = _isExpanded
        ? widget.specifications
        : widget.specifications.take(_maxInitialItems).toList();

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grayColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0A000000), // #0000000A
            offset: const Offset(0, 2),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Use spread operator instead of ListView.builder for better height calculation
            ...itemsToShow.map(
              (spec) => Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: SpecificationItem(specification: spec),
              ),
            ),
            if (hasMoreItems) ...[
              Divider(color: AppColors.dividerColor),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _isExpanded ? 'Show Less' : 'More details',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.green300,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    AnimatedRotation(
                      duration: Duration(milliseconds: 300),
                      turns: _isExpanded ? 0.5 : 0,
                      child: SvgPicture.asset(
                        AssetConstants.caretDownIcon,
                        colorFilter: ColorFilter.mode(
                          AppColors.green300,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SpecificationItem extends StatelessWidget {
  final ProductSpecificationModel specification;
  const SpecificationItem({super.key, required this.specification});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Column(
          children: [
            SvgPicture.asset(specification.icon, height: 24, width: 24),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              specification.title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.black400,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              specification.value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
