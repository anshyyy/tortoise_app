import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
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
  int _selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.secondary,
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
                backgroundColor: colorScheme.secondaryContainer.withValues(
                  alpha: 0.05,
                ),
                width: 326,
                height: 54,
                borderColor: colorScheme.scrim,
                borderWidth: 1,
                tagDisplayMode: TagDisplayMode.horizontal,
                prefixIconPath: AssetConstants.searchIcon,
                tagBorderRadius: 8,
                tagBackgroundColor: colorScheme.primary,
                tagRemoveIconColor: colorScheme.scrim,
                tagTextColor: colorScheme.scrim,

                prefixIconColor: colorScheme.scrim,
                controller: _controller,
                initialTags: [],
                tagPrefix: '',
                textSeparators: const [' ', ','],
                validator: (tag) {
                  return null;
                },
                onTagAdded: (tag) {},
                onTagDeleted: (tag) {},
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.scrim,
                  ),
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
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          image: CompanyData.companyData[index].image,
                          title: CompanyData.companyData[index].name,
                          isSelected: index == _selectedIndex,
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
