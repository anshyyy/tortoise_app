import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';
import 'package:tortoise/src/data/company_data.dart';
import 'package:tortoise/src/widgets/app_bar/k_app_bar.dart';
import 'package:tortoise/src/widgets/buttons/company_button.dart';
import 'package:tortoise/src/widgets/buttons/svg_icon_button.dart';
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.gray500,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom app bar with back button
          KAppBar(
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
                    (company) => company.name == tag,
                  );
                  _selectedIndex.remove(companyIndex);
                  setState(() {});
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
