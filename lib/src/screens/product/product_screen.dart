import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';
import 'package:tortoise/src/models/product_data_model.dart';
import 'package:tortoise/src/widgets/app_bar/k_app_bar.dart';
import 'package:tortoise/src/widgets/buttons/svg_icon_button.dart';
import 'package:tortoise/src/widgets/carousel/k_carousel.dart';
import 'package:tortoise/src/widgets/misc/k_color_box.dart';
import 'package:tortoise/src/widgets/misc/k_size_box.dart';
import 'package:tortoise/src/widgets/tile/k_tile.dart';

class ProductScreen extends StatefulWidget {
  final ProductDataModel product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedColorVariantIndex = 0;
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.gray500,
      appBar: KAppBar(
        title: Text(
          widget.product.name,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: SvgIconButton(
          icon: AssetConstants.caretLeftIcon,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KTile(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetConstants.truckIcon),
                  SizedBox(width: 8),
                  Text(
                    'Shipping starts from 19th September onwards',
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.brown500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.product.colorVariants.isNotEmpty
                  ? KCarousel(
                      height: 300,
                      imagePaths: widget
                          .product
                          .colorVariants[selectedColorVariantIndex]
                          .images,
                      borderRadius: BorderRadius.circular(16),
                      showPageIndicators: true,
                      onImageTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${widget.product.name} image tapped!',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        print('Product image changed to: $index');
                      },
                    )
                  : Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: AppColors.gray300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'No images available',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.black500.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
            ),
            KTile(
              height: 54,
              backgroundColor: AppColors.green800,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetConstants.shieldIcon),
                  SizedBox(width: 16),
                  Text(
                    'Protected with Tortoise Corporate Care',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green100,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FINISH",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black500.withValues(alpha: 0.25),
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Pick a Color",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Display all color variants in a row
                  if (widget.product.colorVariants.isNotEmpty)
                    Row(
                      children: widget.product.colorVariants
                          .asMap()
                          .entries
                          .map((entry) {
                            final index = entry.key;
                            final colorVariant = entry.value;

                            return Padding(
                              padding: EdgeInsets.only(
                                right:
                                    index <
                                        widget.product.colorVariants.length - 1
                                    ? 12
                                    : 0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColorVariantIndex = index;
                                  });
                                },
                                child: KColorBox(
                                  color: Color(
                                    int.parse(
                                      colorVariant.colorCode.replaceFirst(
                                        '#',
                                        '0xff',
                                      ),
                                    ),
                                  ),
                                  isSelected:
                                      selectedColorVariantIndex == index,
                                ),
                              ),
                            );
                          })
                          .toList(),
                    )
                  else
                    Text(
                      'No color variants available',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.black500.withValues(alpha: 0.5),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "STORAGE",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black500.withValues(alpha: 0.25),
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "How much storage do you need?",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Display all size variants in a wrap
                  if (widget.product.sizes.isNotEmpty)
                    Wrap(
                      spacing: 12.0, // Horizontal spacing between items
                      runSpacing: 12.0, // Vertical spacing between rows
                      children: widget.product.sizes.asMap().entries.map((
                        entry,
                      ) {
                        final index = entry.key;
                        final size = entry.value;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSizeIndex = index;
                            });
                          },
                          child: KSizeBox(
                            text: size,
                            isSelected: selectedSizeIndex == index,
                          ),
                        );
                      }).toList(),
                    )
                  else
                    Text(
                      'No color variants available',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.black500.withValues(alpha: 0.5),
                      ),
                    ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SPECIFICATIONS",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black500.withValues(alpha: 0.25),
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
