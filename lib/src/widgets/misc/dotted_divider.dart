import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';

/// A reusable dotted divider widget that creates a horizontal dotted line
/// 
/// This widget uses a custom painter to create a clean, consistent
/// dotted line divider that can be used throughout the application.
class DottedDivider extends StatelessWidget {
  /// Creates a dotted divider widget
  const DottedDivider({
    super.key,
    this.height = 1.0,
    this.color = AppColors.dividerColor,
    this.dashPattern = const [5, 5],
    this.thickness = 1.0,
    this.padding = EdgeInsets.zero,
  });

  /// The height of the divider line
  final double height;
  
  /// The color of the dotted line
  final Color color;
  
  /// The pattern of dashes (alternating dash and gap lengths)
  final List<double> dashPattern;
  
  /// The thickness of the line
  final double thickness;
  
  /// Padding around the divider
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomPaint(
        size: Size(double.infinity, height),
        painter: DottedLinePainter(
          color: color,
          strokeWidth: thickness,
          dashPattern: dashPattern,
        ),
      ),
    );
  }
}

/// Custom painter for drawing dotted lines
class DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;

  DottedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashPattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    final dashLength = dashPattern.isNotEmpty ? dashPattern[0] : 5.0;
    final gapLength = dashPattern.length > 1 ? dashPattern[1] : 5.0;

    double currentX = 0;
    while (currentX < size.width) {
      path.moveTo(currentX, size.height / 2);
      path.lineTo(currentX + dashLength, size.height / 2);
      currentX += dashLength + gapLength;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
