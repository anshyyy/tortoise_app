import 'package:tortoise/src/models/product_specification_model.dart';

import 'color_variant_model.dart';

class ProductDataModel {
  final String id;
  final String name;
  final String image; // Primary image - kept for backward compatibility and main display
  final String companyId; // Links product to company
  final String category; // e.g., 'Phone', 'Laptop', 'Tablet'
  final double price; // Base product price
  final List<ColorVariantModel> colorVariants; // Different color options with their images
  final List<String> sizes; // Different sizes options with their images
  final List<ProductSpecificationModel> specifications; // Different specifications options with their images
  final String adImage;
  
  ProductDataModel({
    required this.id, 
    required this.name, 
    required this.image,
    required this.companyId,
    required this.category,
    required this.price,
    this.colorVariants = const [], // Default to empty list
    this.sizes = const [], // Default to empty list
    this.specifications = const [], // Default to empty list
    required this.adImage,
  });

  /// Create ProductDataModel from JSON (typically from API response)
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      companyId: json['company_id'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      colorVariants: json['color_variants'] != null
          ? (json['color_variants'] as List)
              .map((variant) => ColorVariantModel.fromJson(variant as Map<String, dynamic>))
              .toList()
          : [],
      sizes: json['sizes'] != null
          ? (json['sizes'] as List)
              .map((size) => size as String)
              .toList()
          : [],
      specifications: json['specifications'] != null
          ? (json['specifications'] as List)
              .map((specification) => ProductSpecificationModel.fromJson(specification as Map<String, dynamic>))
              .toList()
          : [],
      adImage: json['ad_image'] as String,
    );
  }

  /// Convert ProductDataModel to JSON (for API requests)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'company_id': companyId,
      'category': category,
      'price': price,
      'color_variants': colorVariants.map((variant) => variant.toJson()).toList(),
      'sizes': sizes,
      'specifications': specifications.map((specification) => specification.toJson()).toList(),
      'ad_image': adImage,
    };
  }

  /// Create a copy of ProductDataModel with updated fields
  ProductDataModel copyWith({
    String? id,
    String? name,
    String? image,
    String? companyId,
    String? category,
    double? price,
    List<ColorVariantModel>? colorVariants,
    List<String>? sizes,
    List<ProductSpecificationModel>? specifications,
    String? adImage,
  }) {
    return ProductDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      companyId: companyId ?? this.companyId,
      category: category ?? this.category,
      price: price ?? this.price,
      colorVariants: colorVariants ?? this.colorVariants,
      sizes: sizes ?? this.sizes,
      specifications: specifications ?? this.specifications,
      adImage: adImage ?? this.adImage,
    );
  }

  @override
  String toString() {
    return 'ProductDataModel(id: $id, name: $name, category: $category, price: \$$price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductDataModel &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.companyId == companyId &&
        other.category == category &&
        other.price == price &&
        other.colorVariants.length == colorVariants.length &&
        other.sizes.length == sizes.length &&
        other.specifications.length == specifications.length &&
        other.adImage == adImage;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, image, companyId, category, price, colorVariants.length, sizes.length, specifications.length, adImage);
  }
}
