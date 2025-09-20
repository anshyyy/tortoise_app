import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:textfield_tags/textfield_tags.dart';

/// A reusable text field with tags functionality using the textfield_tags package
///
/// This widget provides a customizable text field that displays tags inline
/// with text input, following the correct API for textfield_tags package.
/// Supports autocomplete, multiline tags, validation, and clear functionality.
/// Uses FormField for proper error display outside the text field.
class KTextFieldTags extends StatefulWidget {
  /// Controller for managing tags
  final StringTagController? controller;

  /// Initial tags to display
  final List<String>? initialTags;

  /// Text separators that trigger tag creation
  final List<String> textSeparators;

  /// Validator function for tags
  final String? Function(List<String>)? validator;

  /// Form field validator (for FormField integration)
  final FormFieldValidator<List<String>>? formFieldValidator;

  /// Height of the text field container
  final double? height;

  /// Width of the text field container
  final double? width;

  /// Border color
  final Color borderColor;

  /// Border radius
  final double borderRadius;

  /// Border width
  final double borderWidth;

  /// Background color
  final Color backgroundColor;

  /// Prefix SVG icon path
  final String? prefixIconPath;

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

  /// Helper text displayed below the field
  final String? helperText;

  /// Helper text style
  final TextStyle? helperStyle;

  /// Error text displayed when validation fails
  final String? errorText;

  /// Function to clear all tags (called by parent widget)
  final VoidCallback? onClearTags;

  /// Enable autocomplete functionality
  final bool enableAutocomplete;

  /// Autocomplete options builder
  final Iterable<String> Function(TextEditingValue)? autocompleteOptionsBuilder;

  /// Autocomplete options view builder
  final Widget Function(BuildContext, void Function(String), Iterable<String>)?
  autocompleteOptionsViewBuilder;

  /// Tag display mode (horizontal, vertical, or wrap)
  final TagDisplayMode tagDisplayMode;

  /// Tag prefix (e.g., '#', '@')
  final String tagPrefix;

  /// Tag background color
  final Color tagBackgroundColor;

  /// Tag text color
  final Color tagTextColor;

  /// Tag border radius
  final double tagBorderRadius;

  /// Tag remove icon color
  final Color tagRemoveIconColor;

  /// Text field cursor color
  final Color cursorColor;

  /// Text field selection color
  final Color selectionColor;

  /// Letter case for tags
  final LetterCase letterCase;

  const KTextFieldTags({
    super.key,
    this.controller,
    this.initialTags,
    this.textSeparators = const [' ', ','],
    this.validator,
    this.formFieldValidator,
    this.height,
    this.width,
    this.borderColor = const Color.fromARGB(255, 74, 137, 92),
    this.borderRadius = 12.0,
    this.borderWidth = 2.0,
    this.backgroundColor = Colors.white,
    this.prefixIconPath,
    this.prefixIconColor = const Color.fromARGB(255, 74, 137, 92),
    this.prefixIconSize = 20.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
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
    this.helperText,
    this.helperStyle,
    this.errorText,
    this.onClearTags,
    this.enableAutocomplete = false,
    this.autocompleteOptionsBuilder,
    this.autocompleteOptionsViewBuilder,
    this.tagDisplayMode = TagDisplayMode.horizontal,
    this.tagPrefix = '#',
    this.tagBackgroundColor = const Color.fromARGB(255, 74, 137, 92),
    this.tagTextColor = Colors.white,
    this.tagBorderRadius = 20.0,
    this.tagRemoveIconColor = const Color.fromARGB(255, 233, 233, 233),
    this.cursorColor = const Color.fromARGB(255, 0, 0, 0),
    this.selectionColor = const Color.fromARGB(255, 74, 137, 92),
    this.letterCase = LetterCase.normal,
  });

  @override
  State<KTextFieldTags> createState() => _KTextFieldTagsState();
}

/// Enum for tag display modes
enum TagDisplayMode { horizontal, vertical, wrap }

class _KTextFieldTagsState extends State<KTextFieldTags> {
  late StringTagController _controller;
  late double _distanceToField;
  FormFieldState<List<String>>? _formFieldState;
  List<String> _previousTags = [];

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? StringTagController();

    // Initialize previous tags with initial tags
    _previousTags = widget.initialTags ?? [];

    // Listen to tag changes and notify form field
    _controller.addListener(_onTagsChanged);
  }

  void _onTagsChanged() {
    print('onTagsChanged');
    final currentTags = _controller.getTags ?? [];
    
    // Check if a new tag was added
    if (currentTags.length > _previousTags.length) {
      // Find the newly added tag
      for (final tag in currentTags) {
        if (!_previousTags.contains(tag)) {
          // Call onTagAdded callback for the new tag
          widget.onTagAdded?.call(tag);
          break;
        }
      }
    }
    
    // Update previous tags for next comparison
    _previousTags = List.from(currentTags);
    
    _formFieldState?.didChange(currentTags);
  }

  /// Method to clear all tags (can be called by parent widget)
  void clearTags() {
    _controller.clearTags();
    _previousTags.clear(); // Reset previous tags tracking
    _formFieldState?.didChange([]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    // Remove listener and dispose controller if we created it
    _controller.removeListener(_onTagsChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  /// Builds the tag widget with proper styling and remove functionality
  Widget _buildTagWidget(dynamic tag, InputFieldValues inputFieldValues) {
    final String tagString = tag.toString();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.tagBorderRadius)),
        color: widget.tagBackgroundColor,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            label: 'Tag: $tagString',
            button: true,
            child: InkWell(
              child: Text(
                '${widget.tagPrefix}$tagString',
                style: TextStyle(color: widget.tagTextColor),
              ),
              onTap: () {
                // Tag tapped - could be used for selection or other actions
                // Note: onTagAdded is now handled in _onTagsChanged when tags are actually added
              },
            ),
          ),
          const SizedBox(width: 4.0),
          Semantics(
            label: 'Remove tag: $tagString',
            button: true,
            child: InkWell(
              child: Icon(
                Icons.cancel,
                size: 14.0,
                color: widget.tagRemoveIconColor,
              ),
              onTap: () {
                inputFieldValues.onTagRemoved(tag);
                widget.onTagDeleted?.call(tagString);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the tags display widget based on display mode
  Widget _buildTagsDisplay(InputFieldValues inputFieldValues) {
    final tags = inputFieldValues.tags;

    if (tags.isEmpty) return const SizedBox.shrink();

    switch (widget.tagDisplayMode) {
      case TagDisplayMode.horizontal:
        return SingleChildScrollView(
          controller: inputFieldValues.tagScrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tags
                .map<Widget>((tag) => _buildTagWidget(tag, inputFieldValues))
                .toList(),
          ),
        );

      case TagDisplayMode.vertical:
        return SingleChildScrollView(
          controller: inputFieldValues.tagScrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: tags
                .map<Widget>((tag) => _buildTagWidget(tag, inputFieldValues))
                .toList(),
          ),
        );

      case TagDisplayMode.wrap:
        return SingleChildScrollView(
          controller: inputFieldValues.tagScrollController,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
            child: Wrap(
              runSpacing: 4.0,
              spacing: 4.0,
              children: tags
                  .map<Widget>((tag) => _buildTagWidget(tag, inputFieldValues))
                  .toList(),
            ),
          ),
        );
    }
  }
  /// Enhanced validator that prevents duplicates and validates input
  String? _enhancedValidator(String tag) {
    // Check for duplicates
    if (_controller.getTags?.contains(tag) == true) {
      return 'You\'ve already entered that';
    }

    // Check for empty or whitespace-only tags
    if (tag.trim().isEmpty) {
      return 'Tag cannot be empty';
    }

    // Call custom validator if provided (for individual tag validation)
    if (widget.validator != null) {
      final customError = widget.validator!([tag]);
      if (customError != null) return customError;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate appropriate width for prefix icon constraints
    final prefixIconWidth = widget.tagDisplayMode == TagDisplayMode.wrap
        ? _distanceToField * 0.8
        : _distanceToField * 0.75;

    return FormField<List<String>>(
      validator: widget.formFieldValidator,
      builder: (FormFieldState<List<String>> field) {
        _formFieldState = field;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main text field container
            Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: field.hasError ? Colors.red : widget.borderColor,
                  width: widget.borderWidth,
                ),
              ),
              child: _buildStandardField(prefixIconWidth),
            ),

            // Error text displayed outside the text field
            if (field.hasError) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  field.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  /// Builds the standard text field with tags
  Widget _buildStandardField(double prefixIconWidth) {
    return TextFieldTags<String>(
      textfieldTagsController: _controller,
      initialTags: widget.initialTags,
      textSeparators: widget.textSeparators,
      letterCase: widget.letterCase,
      validator: _enhancedValidator,
      inputFieldBuilder: (context, inputFieldValues) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              // SVG prefix icon inside the text field
              if (widget.prefixIconPath != null) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    widget.prefixIconPath!,
                    width: widget.prefixIconSize,
                    height: widget.prefixIconSize,
                    colorFilter: ColorFilter.mode(
                      widget.prefixIconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
              // Text field with tags as prefix
              Expanded(
                child: TextField(
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                  enabled: widget.enabled,
                  maxLines: widget.maxLines,
                  obscureText: widget.obscureText,
                  textInputAction: widget.textInputAction,
                  cursorColor: widget.cursorColor,
                  selectionControls: MaterialTextSelectionControls(),
                  style:
                      widget.textStyle ??
                      const TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    helperText: widget.helperText,
                    helperStyle:
                        widget.helperStyle ??
                        TextStyle(color: widget.borderColor),
                    hintText: inputFieldValues.tags.isNotEmpty
                        ? ''
                        : widget.hintText ?? "Enter tag...",
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: prefixIconWidth,
                    ),
                    prefixIcon: inputFieldValues.tags.isNotEmpty
                        ? _buildTagsDisplay(inputFieldValues)
                        : null,
                  ),
                  onChanged: inputFieldValues.onTagChanged,
                  onSubmitted: inputFieldValues.onTagSubmitted,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
