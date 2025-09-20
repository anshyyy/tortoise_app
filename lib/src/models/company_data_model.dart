import 'product_data_model.dart';

class CompanyDataModel {
  final String id;
  final String name;
  final String image;
  final List<ProductDataModel> products; // List of products belonging to this company

  CompanyDataModel({
    required this.id, 
    required this.name, 
    required this.image,
    required this.products,
  });

  /// Create CompanyDataModel from JSON (typically from API response)
  factory CompanyDataModel.fromJson(Map<String, dynamic> json) {
    return CompanyDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      products: (json['products'] as List<dynamic>?)
          ?.map((productJson) => ProductDataModel.fromJson(productJson as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  /// Convert CompanyDataModel to JSON (for API requests)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  /// Create a copy of CompanyDataModel with updated fields
  CompanyDataModel copyWith({
    String? id,
    String? name,
    String? image,
    List<ProductDataModel>? products,
  }) {
    return CompanyDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      products: products ?? this.products,
    );
  }

  // Helper method to get products by category
  List<ProductDataModel> getProductsByCategory(String category) {
    return products.where((product) => product.category == category).toList();
  }

  // Helper method to get all product categories for this company
  List<String> getProductCategories() {
    return products.map((product) => product.category).toSet().toList();
  }

  @override
  String toString() {
    return 'CompanyDataModel(id: $id, name: $name, products: ${products.length})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CompanyDataModel &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        _listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return Object.hash(id, name, image, products);
  }

  /// Helper method to compare lists
  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
