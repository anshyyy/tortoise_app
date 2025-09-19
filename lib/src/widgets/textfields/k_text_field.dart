import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A highly customizable text field widget with support for prefix/suffix icons,
/// custom styling, and tag conversion functionality
/// 
/// This widget follows the Open/Closed Principle by being open for extension
/// through various customization parameters while closed for modification.
class KTextField extends StatefulWidget {
  /// Controller for the text field
  final TextEditingController? controller;
  
  /// Placeholder text
  final String? hintText;
  
  /// Height of the text field
  final double? height;
  
  /// Width of the text field
  final double? width;
  
  /// Border color
  final Color borderColor;
  
  /// Border radius
  final double borderRadius;
  
  /// Background color
  final Color backgroundColor;
  
  /// Prefix icon (SVG asset path)
  final String? prefixIcon;
  
  /// Suffix icon (SVG asset path)
  final String? suffixIcon;
  
  /// Color of the prefix icon
  final Color prefixIconColor;
  
  /// Color of the suffix icon
  final Color suffixIconColor;
  
  /// Size of the prefix icon
  final double prefixIconSize;
  
  /// Size of the suffix icon
  final double suffixIconSize;
  
  /// Padding inside the text field
  final EdgeInsets contentPadding;
  
  /// Text style
  final TextStyle? textStyle;
  
  /// Hint text style
  final TextStyle? hintStyle;
  
  /// Callback when suffix icon is pressed
  final VoidCallback? onSuffixPressed;
  
  /// Callback when prefix icon is pressed
  final VoidCallback? onPrefixPressed;
  
  /// Whether the text field is enabled
  final bool enabled;
  
  /// Maximum number of lines
  final int? maxLines;
  
  /// Whether to obscure text (for passwords)
  final bool obscureText;
  
  /// Text input action
  final TextInputAction? textInputAction;
  
  /// Callback when text changes
  final ValueChanged<String>? onChanged;
  
  /// Callback when submitted
  final ValueChanged<String>? onSubmitted;
  
  /// Focus node
  final FocusNode? focusNode;

  const KTextField({
    super.key,
    this.controller,
    this.hintText,
    this.height,
    this.width,
    this.borderColor = Colors.black,
    this.borderRadius = 12.0,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor = Colors.black,
    this.suffixIconColor = Colors.black,
    this.prefixIconSize = 20.0,
    this.suffixIconSize = 20.0,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.textStyle,
    this.hintStyle,
    this.onSuffixPressed,
    this.onPrefixPressed,
    this.enabled = true,
    this.maxLines = 1,
    this.obscureText = false,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  State<KTextField> createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    // Only dispose if we created the controller/focus node
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.borderColor,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          // Prefix icon
          if (widget.prefixIcon != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: GestureDetector(
                onTap: widget.onPrefixPressed,
                child: SvgPicture.asset(
                  widget.prefixIcon!,
                  width: widget.prefixIconSize,
                  height: widget.prefixIconSize,
                  colorFilter: ColorFilter.mode(
                    widget.prefixIconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          
          // Text field
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              obscureText: widget.obscureText,
              textInputAction: widget.textInputAction,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              style: widget.textStyle ?? const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding: widget.contentPadding,
                isDense: true,
              ),
            ),
          ),
          
          // Suffix icon
          if (widget.suffixIcon != null) ...[
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: widget.onSuffixPressed,
                child: SvgPicture.asset(
                  widget.suffixIcon!,
                  width: widget.suffixIconSize,
                  height: widget.suffixIconSize,
                  colorFilter: ColorFilter.mode(
                    widget.suffixIconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
