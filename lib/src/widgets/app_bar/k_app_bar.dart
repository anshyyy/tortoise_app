import 'package:flutter/material.dart';

/// Custom AppBar widget that provides proper title centering and notch handling
class KAppBar extends StatelessWidget {
  final Text? title;
  final Widget? leading;
  final double height;
  final Color? backgroundColor;
  final double elevation;
  final bool centerTitle;
  final EdgeInsets? padding;
  final EdgeInsets? leadingPadding;
  final Widget? child;

  const KAppBar({
    super.key,
    this.title,
    this.leading,
    this.height = 114,
    this.backgroundColor = Colors.white,
    this.elevation = 0,
    this.centerTitle = true,
    this.padding,
    this.leadingPadding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add top padding to handle device notches and status bar
      padding:
          padding ??
          EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 24,
            right: 24,
            bottom: 0,
          ),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 2,
                ),
              ]
            : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Leading widget with fixed width to maintain consistent spacing
          SizedBox(
            child: Padding(
              padding: leadingPadding ?? const EdgeInsets.only(right: 24),
              child: leading ?? const SizedBox.shrink(),
            ),
          ),

          // Title section with proper centering logic
          // if child is provided, it will be placed in the center
          if (child != null) Center(child: child),
          // if child is not provided, it will be placed in the center
          if (child == null && title != null)
            Expanded(child: centerTitle ? Center(child: title!) : title!),

          // Spacer to balance the leading widget when centering
          if (centerTitle && leading != null) const SizedBox(width: 48),
        ],
      ),
    );
  }
}
