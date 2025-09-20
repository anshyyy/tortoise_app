import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';

/// A reusable carousel widget that displays a list of images with left and right swipe support
///
/// This widget uses Flutter's PageView class to create a horizontal scrolling carousel
/// that supports touch gestures for navigation between images.
class KCarousel extends StatefulWidget {
  /// The height of the carousel widget
  final double height;

  /// List of image paths to display in the carousel
  final List<String> imagePaths;

  /// Optional callback when an image is tapped
  final VoidCallback? onImageTap;

  /// Optional callback when the carousel page changes
  final ValueChanged<int>? onPageChanged;

  /// Whether to show page indicators
  final bool showPageIndicators;

  /// Border radius for the carousel images
  final BorderRadius? borderRadius;

  const KCarousel({
    super.key,
    required this.height,
    required this.imagePaths,
    this.onImageTap,
    this.onPageChanged,
    this.showPageIndicators = true,
    this.borderRadius,
  });

  @override
  State<KCarousel> createState() => _KCarouselState();
}

class _KCarouselState extends State<KCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Handles page changes and updates the current index
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onPageChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {

    if (widget.imagePaths.isEmpty) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: widget.borderRadius,
        ),
        child: const Center(
          child: Text(
            'No images available',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    }

    return Column(
      children: [
        // Main carousel container
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: AppColors.gray500,
            borderRadius: widget.borderRadius),
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: widget.imagePaths.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: widget.onImageTap,
                  child: Center(child: Image.asset(
                    widget.imagePaths[index],
                  //  fit: BoxFit.fill,
                    width: double.infinity,
                    height: widget.height,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                      );
                    },
                  ),),
                );
              },
            ),
          ),
        ),

        // Page indicators
        if (widget.showPageIndicators && widget.imagePaths.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              height: 16.0,
              width:
                  widget.imagePaths.length * 12.0 +
                  (widget.imagePaths.length - 1) * 4.0,
              decoration: BoxDecoration(
                color: AppColors.gray400,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imagePaths.length,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 3.0 : 2.0,
                      right: index == widget.imagePaths.length - 1 ? 3.0 : 2.0,
                    ),
                    width: 6.0,
                    height: 6.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.white
                          : AppColors.gray300,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
