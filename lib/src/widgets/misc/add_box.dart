import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/src/constants/app_colors.dart';
import 'package:tortoise/src/constants/asset_constants.dart';

/// A widget that displays a vertically long image with expand/collapse functionality.
/// Initially shows the image at 393px height, and expands to full height when "More details" is clicked.
class AddBox extends StatefulWidget {
  /// The image asset path to display
  final String imagePath;

  const AddBox({
    super.key,
    required this.imagePath,
  });

  @override
  State<AddBox> createState() => _AddBoxState();
}

class _AddBoxState extends State<AddBox> {
  bool _isExpanded = false;
  static const double _initialHeight = 393.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      //padding: const EdgeInsets.all(16),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image section with expand/collapse functionality
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isExpanded ? null : _initialHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.asset(
                widget.imagePath,
                fit: _isExpanded ? BoxFit.contain : BoxFit.cover,
                alignment: _isExpanded ? Alignment.center : Alignment.topCenter,
                width: double.infinity,
                // When expanded, let the image show its natural height
                // When collapsed, constrain to initial height and show top part
                height: _isExpanded ? null : _initialHeight,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // More details toggle button
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isExpanded ? 'Show Less' : 'More details',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.green300,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
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
          ),
        ],
      ),
    );
  }

}
