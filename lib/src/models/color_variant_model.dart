/// Model representing a color variant of a product
/// Each color variant can have multiple images showing the product in that color
class ColorVariantModel {
  final String colorName; // e.g., 'Red', 'Blue', 'Black', 'White'
  final String colorCode; // Hex color code for UI display
  final List<String> images; // Multiple images of the product in this color
  final bool isAvailable; // Whether this color is currently available
  final double? priceAdjustment; // Optional price difference for this color

  const ColorVariantModel({
    required this.colorName,
    required this.colorCode,
    required this.images,
    this.isAvailable = true,
    this.priceAdjustment,
  });

  /// Create ColorVariantModel from JSON (typically from API response)
  factory ColorVariantModel.fromJson(Map<String, dynamic> json) {
    return ColorVariantModel(
      colorName: json['color_name'] as String,
      colorCode: json['color_code'] as String,
      images: List<String>.from(json['images'] as List),
      isAvailable: json['is_available'] as bool? ?? true,
      priceAdjustment: json['price_adjustment'] != null 
          ? (json['price_adjustment'] as num).toDouble() 
          : null,
    );
  }

  /// Convert ColorVariantModel to JSON (for API requests)
  Map<String, dynamic> toJson() {
    return {
      'color_name': colorName,
      'color_code': colorCode,
      'images': images,
      'is_available': isAvailable,
      if (priceAdjustment != null) 'price_adjustment': priceAdjustment,
    };
  }

  /// Create a copy of ColorVariantModel with updated fields
  ColorVariantModel copyWith({
    String? colorName,
    String? colorCode,
    List<String>? images,
    bool? isAvailable,
    double? priceAdjustment,
  }) {
    return ColorVariantModel(
      colorName: colorName ?? this.colorName,
      colorCode: colorCode ?? this.colorCode,
      images: images ?? this.images,
      isAvailable: isAvailable ?? this.isAvailable,
      priceAdjustment: priceAdjustment ?? this.priceAdjustment,
    );
  }

  @override
  String toString() {
    return 'ColorVariantModel(colorName: $colorName, colorCode: $colorCode, imagesCount: ${images.length}, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ColorVariantModel &&
        other.colorName == colorName &&
        other.colorCode == colorCode &&
        other.images.length == images.length &&
        other.isAvailable == isAvailable &&
        other.priceAdjustment == priceAdjustment;
  }

  @override
  int get hashCode {
    return Object.hash(colorName, colorCode, images.length, isAvailable, priceAdjustment);
  }
}
