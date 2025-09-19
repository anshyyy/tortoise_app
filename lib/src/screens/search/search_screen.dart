import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:tortoise/src/constants/asset_constants.dart';
import 'package:tortoise/src/widgets/app_bar/k_app_bar.dart';
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
    return Scaffold(
      body: Column(
        children: [
          // Custom app bar with back button
          KAppBar(
            elevation: 1,
            leading: SvgIconButton(
              icon: AssetConstants.caretLeftIcon,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            child: const Text(
              'Search',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          KTextFieldTags(
            height: 50,
            width: double.infinity,
            controller: _controller,
            initialTags: ['Apple', 'Samsung', 'Google'],
            textSeparators: const [' ', ','],
            validator: (tag) {
              print(tag);
              return null;
            },
          ),
        ],
      ),
    );
  }
}
