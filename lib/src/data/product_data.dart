import '../models/product_data_model.dart';

class ProductData {
  ProductData._();

  // Apple Products
  static final List<ProductDataModel> appleProducts = [
    ProductDataModel(
      id: 'apple_1',
      name: 'iPhone 16 Pro',
      image: 'assets/images/iphone_16_pro.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 999.00,
    ),
    ProductDataModel(
      id: 'apple_2',
      name: 'iPhone 16 Pro Max',
      image: 'assets/images/iphone_16_pro_max.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 1199.00,
    ),
    ProductDataModel(
      id: 'apple_3',
      name: 'iPhone 16',
      image: 'assets/images/iphone_16.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 799.00,
    ),
    ProductDataModel(
      id: 'apple_4',
      name: 'iPhone 16 Plus',
      image: 'assets/images/iphone_16_plus.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 899.00,
    ),
    ProductDataModel(
      id: 'apple_5',
      name: 'iPhone 15',
      image: 'assets/images/iphone_15.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 699.00,
    ),
    ProductDataModel(
      id: 'apple_6',
      name: 'iPhone 15 Plus',
      image: 'assets/images/iphone_15_plus.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 799.00,
    ),
    ProductDataModel(
      id: 'apple_7',
      name: 'iPad Pro',
      image: 'assets/images/ipad_pro.png',
      companyId: '1', // Apple
      category: 'Tablet',
      price: 799.00,
    ),
    ProductDataModel(
      id: 'apple_8',
      name: 'iPad',
      image: 'assets/images/ipad.png',
      companyId: '1', // Apple
      category: 'Tablet',
      price: 449.00,
    ),
    ProductDataModel(
      id: 'apple_9',
      name: 'MacBook Air',
      image: 'assets/images/macbook_air.png',
      companyId: '1', // Apple
      category: 'Laptop',
      price: 999.00,
    ),
    ProductDataModel(
      id: 'apple_10',
      name: 'MacBook Pro',
      image: 'assets/images/macbook.png',
      companyId: '1', // Apple
      category: 'Laptop',
      price: 1599.00,
    ),
  ];

  // Google Products
  static final List<ProductDataModel> googleProducts = [
    ProductDataModel(
      id: 'google_1',
      name: 'Pixel 9 Pro',
      image: 'assets/images/pixel9.png',
      companyId: '2', // Google
      category: 'Phone',
      price: 999.00,
    ),
  ];

  // Samsung Products
  static final List<ProductDataModel> samsungProducts = [];

  // OnePlus Products
  static final List<ProductDataModel> oneplusProducts = [];

  // Combined list of all products
  static List<ProductDataModel> get allProducts => [
    ...appleProducts,
    ...googleProducts,
    ...samsungProducts,
    ...oneplusProducts,
  ];

  // Helper method to get products by company ID
  static List<ProductDataModel> getProductsByCompanyId(String companyId) {
    return allProducts.where((product) => product.companyId == companyId).toList();
  }

  // Helper method to get products by category across all companies
  static List<ProductDataModel> getProductsByCategory(String category) {
    return allProducts.where((product) => product.category == category).toList();
  }

  // Helper method to get products by company and category
  static List<ProductDataModel> getProductsByCompanyAndCategory(
    String companyId, 
    String category
  ) {
    return allProducts.where((product) => 
      product.companyId == companyId && product.category == category
    ).toList();
  }
}
