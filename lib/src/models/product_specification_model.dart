class ProductSpecificationModel {
  final String title;
  final String value;
  final String icon;

  ProductSpecificationModel({
    required this.title,
    required this.value,
    required this.icon,
  });

  factory ProductSpecificationModel.fromJson(Map<String, dynamic> json) {
    return ProductSpecificationModel(
      title: json['title'],
      value: json['value'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'value': value, 'icon': icon};
  }
}
