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
      name: 'Pixel 8 Pro',
      image: 'assets/images/google.png',
      companyId: '2', // Google
      category: 'Phone',
      price: 999.00,
    ),
    ProductDataModel(
      id: 'google_2',
      name: 'Pixel 8',
      image: 'assets/images/google.png',
      companyId: '2', // Google
      category: 'Phone',
      price: 699.00,
    ),
    ProductDataModel(
      id: 'google_3',
      name: 'Pixel 7a',
      image: 'assets/images/google.png',
      companyId: '2', // Google
      category: 'Phone',
      price: 499.00,
    ),
    ProductDataModel(
      id: 'google_4',
      name: 'Pixel Tablet',
      image: 'assets/images/google.png',
      companyId: '2', // Google
      category: 'Tablet',
      price: 499.00,
    ),
    ProductDataModel(
      id: 'google_5',
      name: 'Pixelbook Go',
      image: 'assets/images/google.png',
      companyId: '2', // Google
      category: 'Laptop',
      price: 649.00,
    ),
  ];

  // Samsung Products
  static final List<ProductDataModel> samsungProducts = [
    ProductDataModel(
      id: 'samsung_1',
      name: 'Galaxy S24 Ultra',
      image: 'assets/images/samsung.png',
      companyId: '3', // Samsung
      category: 'Phone',
      price: 1299.00,
    ),
    ProductDataModel(
      id: 'samsung_2',
      name: 'Galaxy S24+',
      image: 'assets/images/samsung.png',
      companyId: '3', // Samsung
      category: 'Phone',
      price: 999.00,
    ),
    ProductDataModel(
      id: 'samsung_3',
      name: 'Galaxy S24',
      image: 'assets/images/samsung.png',
      companyId: '3', // Samsung
      category: 'Phone',
      price: 799.00,
    ),
    ProductDataModel(
      id: 'samsung_4',
      name: 'Galaxy Tab S9',
      image: 'assets/images/samsung.png',
      companyId: '3', // Samsung
      category: 'Tablet',
      price: 799.00,
    ),
    ProductDataModel(
      id: 'samsung_5',
      name: 'Galaxy Book4 Pro',
      image: 'assets/images/samsung.png',
      companyId: '3', // Samsung
      category: 'Laptop',
      price: 1299.00,
    ),
  ];

  // OnePlus Products
  static final List<ProductDataModel> oneplusProducts = [
    ProductDataModel(
      id: 'oneplus_1',
      name: 'OnePlus 12',
      image: 'assets/images/oneplus.png',
      companyId: '4', // OnePlus
      category: 'Phone',
      price: 799.00,
    ),
    ProductDataModel(
      id: 'oneplus_2',
      name: 'OnePlus 12R',
      image: 'assets/images/oneplus.png',
      companyId: '4', // OnePlus
      category: 'Phone',
      price: 599.00,
    ),
    ProductDataModel(
      id: 'oneplus_3',
      name: 'OnePlus Pad',
      image: 'assets/images/oneplus.png',
      companyId: '4', // OnePlus
      category: 'Tablet',
      price: 479.00,
    ),
  ];

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
