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
  final List<BoxShadow>? customShadow;
  final bool useCustomShadow;
  final double? leadingWidth;
  final double titleSpacing;

  const KAppBar({
    super.key,
    this.title,
    this.leading,
    this.height = 66,
    this.backgroundColor = Colors.white,
    this.elevation = 1,
    this.centerTitle = true,
    this.padding,
    this.leadingPadding,
    this.child,
    this.customShadow,
    this.useCustomShadow = true,
    this.leadingWidth,
    this.titleSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    // Default shadow configuration
    final defaultShadow = [
      BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 2),
    ];

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: useCustomShadow ? (customShadow ?? defaultShadow) : null,
      ),
      child: AppBar(
        title: title,
        leading: leading != null
            ? Container(
                padding: leadingPadding,
                alignment: Alignment.center,
                child: leading,
              )
            : null,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove AppBar's own elevation
        centerTitle: centerTitle,
        toolbarHeight: height,
        actions: [if (child != null) child!],
        actionsPadding: padding,
        // Remove gaps between leading, title, and actions
        leadingWidth: leadingWidth ?? (leading != null ? null : 0),
        titleSpacing: titleSpacing, // Remove gap between leading and title
        actionsIconTheme: const IconThemeData(size: 0), // Remove default icon spacing
        automaticallyImplyLeading: false, // Prevent default back button spacing
      ),
    );
  }
}
