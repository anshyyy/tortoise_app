import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

/// A reusable text field with tags functionality using the textfield_tags package
/// 
/// This widget provides a customizable text field that displays tags inline
/// with text input, following the correct API for textfield_tags package.
class KTextFieldTags extends StatefulWidget {
  /// Controller for managing tags
  final StringTagController? controller;
  
  /// Initial tags to display
  final List<String>? initialTags;
  
  /// Text separators that trigger tag creation
  final List<String> textSeparators;
  
  /// Validator function for tags
  final String? Function(String)? validator;
  
  /// Height of the text field container
  final double? height;
  
  /// Width of the text field container
  final double? width;
  
  /// Border color
  final Color borderColor;
  
  /// Border radius
  final double borderRadius;
  
  /// Background color
  final Color backgroundColor;
  
  /// Prefix icon
  final IconData? prefixIcon;
  
  /// Color of the prefix icon
  final Color prefixIconColor;
  
  /// Size of the prefix icon
  final double prefixIconSize;
  
  /// Padding inside the text field
  final EdgeInsets contentPadding;
  
  /// Text style
  final TextStyle? textStyle;
  
  /// Hint text
  final String? hintText;
  
  /// Hint text style
  final TextStyle? hintStyle;
  
  /// Callback when a tag is added
  final ValueChanged<String>? onTagAdded;
  
  /// Callback when a tag is deleted
  final ValueChanged<String>? onTagDeleted;
  
  /// Whether the text field is enabled
  final bool enabled;
  
  /// Maximum number of lines
  final int? maxLines;
  
  /// Whether to obscure text (for passwords)
  final bool obscureText;
  
  /// Text input action
  final TextInputAction? textInputAction;
  
  /// Focus node
  final FocusNode? focusNode;

  const KTextFieldTags({
    super.key,
    this.controller,
    this.initialTags,
    this.textSeparators = const [' ', ','],
    this.validator,
    this.height,
    this.width,
    this.borderColor = Colors.black,
    this.borderRadius = 12.0,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.prefixIcon,
    this.prefixIconColor = Colors.black,
    this.prefixIconSize = 20.0,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.onTagAdded,
    this.onTagDeleted,
    this.enabled = true,
    this.maxLines = 1,
    this.obscureText = false,
    this.textInputAction,
    this.focusNode,
  });

  @override
  State<KTextFieldTags> createState() => _KTextFieldTagsState();
}

class _KTextFieldTagsState extends State<KTextFieldTags> {
  late StringTagController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? StringTagController();
  }

  @override
  void dispose() {
    // Only dispose if we created the controller
    if (widget.controller == null) {
      _controller.dispose();
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
      child: TextFieldTags<String>(
        textfieldTagsController: _controller,
        initialTags: widget.initialTags,
        textSeparators: widget.textSeparators,
        validator: widget.validator,
        inputFieldBuilder: (context, inputFieldValues) {
          return Row(
            children: [
              // Prefix icon
              if (widget.prefixIcon != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Icon(
                    widget.prefixIcon,
                    color: widget.prefixIconColor,
                    size: widget.prefixIconSize,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              
              // Text field
              Expanded(
                child: TextField(
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                  enabled: widget.enabled,
                  maxLines: widget.maxLines,
                  obscureText: widget.obscureText,
                  textInputAction: widget.textInputAction,
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
            ],
          );
        },
      ),
    );
  }
}
