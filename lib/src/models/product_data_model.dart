class ProductDataModel {
  final String id;
  final String name;
  final String image;
  final String companyId; // Links product to company
  final String category; // e.g., 'Phone', 'Laptop', 'Tablet'
  final double price; // Product price

  ProductDataModel({
    required this.id, 
    required this.name, 
    required this.image,
    required this.companyId,
    required this.category,
    required this.price,
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
  }) {
    return ProductDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      companyId: companyId ?? this.companyId,
      category: category ?? this.category,
      price: price ?? this.price,
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
        other.price == price;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, image, companyId, category, price);
  }
}
