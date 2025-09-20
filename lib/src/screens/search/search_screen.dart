import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';
import 'package:tortoise/src/data/company_data.dart';
import 'package:tortoise/src/models/product_data_model.dart';
import 'package:tortoise/src/routes/router.dart';
import 'package:tortoise/src/widgets/app_bar/k_app_bar.dart';
import 'package:tortoise/src/widgets/buttons/company_button.dart';
import 'package:tortoise/src/widgets/buttons/svg_icon_button.dart';
import 'package:tortoise/src/widgets/cards/product_card.dart';
import 'package:tortoise/src/widgets/textfields/k_text_field_tags.dart';

/// Search screen widget for demonstrating named routing and search functionality
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late StringTagController _controller;
  List<int> _selectedIndex = [];

  @override
  void initState() {
    super.initState();
    _controller = StringTagController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleCompanySelection(int index) {
    final companyName = CompanyData.companyData[index].name;

    // Check if tag already exists
    final currentTags = _controller.getTags ?? [];
    print('currentTags: $currentTags');
    print('companyName: $companyName');
    if (!currentTags.contains(companyName)) {
      _controller.addTag(companyName);
      setState(() {
        _selectedIndex.add(index);
      });
    } else {
      _controller.removeTag(companyName);
      setState(() {
        _selectedIndex.remove(index);
      });
    }
  }

  /// Get all products from selected companies
  List<ProductDataModel> _getSelectedCompanyProducts() {
    if (_selectedIndex.isEmpty) {
      return [];
    }

    final List<ProductDataModel> allProducts = [];
    for (final index in _selectedIndex) {
      if (index >= 0 && index < CompanyData.companyData.length) {
        allProducts.addAll(CompanyData.companyData[index].products);
      }
    }
    return allProducts;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedProducts = _getSelectedCompanyProducts();
    return Scaffold(
      backgroundColor: AppColors.gray500,
      body: CustomScrollView(
        slivers: [
          // Custom app bar with back button
          SliverToBoxAdapter(
            child: KAppBar(
              //  height: 130,
              elevation: 1,
              leading: SvgIconButton(
                icon: AssetConstants.caretLeftIcon,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              child: Padding(
                padding: EdgeInsets.only(right: 24),
                child: KTextFieldTags(
                  backgroundColor: AppColors.black500.withValues(alpha: 0.05),
                  width: 326,
                  height: 54,
                  hintText: 'Search...',
                  borderColor: AppColors.blackColor,
                  borderWidth: 1,
                  tagDisplayMode: TagDisplayMode.horizontal,
                  prefixIconPath: AssetConstants.searchIcon,
                  tagBorderRadius: 8,
                  tagBackgroundColor: AppColors.whiteColor,
                  tagRemoveIconColor: AppColors.black500,
                  tagTextColor: AppColors.blackColor,

                  prefixIconColor: AppColors.blackColor,
                  controller: _controller,
                  initialTags: [],
                  tagPrefix: '',
                  textSeparators: const [' ', ','],
                  validator: (tag) {
                    return null;
                  },
                  onTagAdded: (tag) {
                    print('onTagAdded tag: $tag');
                    _selectedIndex.add(
                      CompanyData.companyData.indexWhere(
                        (company) =>
                            company.name.toLowerCase() == tag.toLowerCase(),
                      ),
                    );
                    setState(() {});
                  },
                  onTagDeleted: (tag) {
                    // When a company tag is deleted, update the selected index

                    final companyIndex = CompanyData.companyData.indexWhere(
                      (company) =>
                          company.name.toLowerCase() == tag.toLowerCase(),
                    );
                    _selectedIndex.remove(companyIndex);
                    setState(() {});
                  },
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Search from popular brands',
                  style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,

                    itemCount: CompanyData.companyData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16),

                        child: CompanyButton(
                          onTap: () => _handleCompanySelection(index),
                          image: CompanyData.companyData[index].image,
                          title: CompanyData.companyData[index].name,
                          isSelected: _selectedIndex.contains(index),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),
                if (selectedProducts.isNotEmpty)
                  Text(
                    "Available Devices",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 16,
                    ),
                  ),
              ]),
            ),
          ),

          // Products grid or empty state based on available products
          if (_controller.getTags?.isNotEmpty ?? false)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              sliver: selectedProducts.isNotEmpty
                  ? SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                170 / 108, // Match Figma specs: width/height
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final product = selectedProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNameEnum.product.path,
                              arguments: product,
                            );
                          },
                          child: ProductCard(
                            productName: product.name,
                            productImage: product.image,
                          ),
                        );
                      }, childCount: selectedProducts.length),
                    )
                  : SliverToBoxAdapter(child: EmptyStateCard()),
            ),
          // Add some bottom padding
          SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class EmptyStateCard extends StatelessWidget {
  const EmptyStateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24),
          Icon(Icons.not_accessible, size: 40, color: AppColors.black500),
          SizedBox(height: 16),
          Text(
            'No products found',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
