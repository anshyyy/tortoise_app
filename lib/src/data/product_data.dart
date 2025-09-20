import '../models/product_data_model.dart';
import '../models/color_variant_model.dart';

class ProductData {
  ProductData._();

  // Apple Products
  static final List<ProductDataModel> appleProducts = [
    ProductDataModel(
      id: 'apple_0',
      name: 'iPhone 17 Pro',
      image: 'assets/images/iphone_17_pro.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 999.00,
      sizes: [
        '128 GB',
        '256 GB',
        '512 GB',
        '1 TB',
      ],
      colorVariants: [
        ColorVariantModel(
          colorName: 'Silver',
          colorCode: '#e6e6e6',
          images: [
            'assets/images/iphone_17_pro_silver_1.webp',
            'assets/images/iphone_17_pro_silver_2.webp',
            'assets/images/iphone_17_pro_silver_3.webp',
            'assets/images/iphone_17_pro_silver_4.webp',
          ],
        ),
        ColorVariantModel(
          colorName: 'Orange',
          colorCode: '#f87e35',
          images: [
            'assets/images/iphone_17_pro_orange.webp',
            'assets/images/iphone_17_pro_orange_2.webp',
            'assets/images/iphone_17_pro_orange_3.webp',
            'assets/images/iphone_17_pro_orange_4.webp',
          ],
        ),
        ColorVariantModel(
          colorName: 'Blue',
          colorCode: '#47527d',
          images: [
            'assets/images/iphone_17_pro_blue_1.webp',
            'assets/images/iphone_17_pro_blue_2.webp',
            'assets/images/iphone_17_pro_blue_3.webp',
            'assets/images/iphone_17_pro_blue_4.webp',
          ],
        ),
      ],
    ),
    ProductDataModel(
      id: 'apple_1',
      name: 'iPhone 16 Pro',
      image: 'assets/images/iphone_16_pro.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 999.00,
      sizes: [
        '128 GB',
        '256 GB',
        '512 GB',
      ],
      colorVariants: [
        ColorVariantModel(
          colorName: 'Natural Titanium',
          colorCode: '#8E8E93',
          images: [
            'assets/images/iphone_16_pro.png',
            'assets/images/iphone_16_pro_back.png',
            'assets/images/iphone_16_pro_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Blue Titanium',
          colorCode: '#007AFF',
          images: [
            'assets/images/iphone_16_pro_blue.png',
            'assets/images/iphone_16_pro_blue_back.png',
            'assets/images/iphone_16_pro_blue_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'White Titanium',
          colorCode: '#F2F2F7',
          images: [
            'assets/images/iphone_16_pro_white.png',
            'assets/images/iphone_16_pro_white_back.png',
            'assets/images/iphone_16_pro_white_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Black Titanium',
          colorCode: '#1C1C1E',
          images: [
            'assets/images/iphone_16_pro_black.png',
            'assets/images/iphone_16_pro_black_back.png',
            'assets/images/iphone_16_pro_black_side.png',
          ],
        ),
      ],
    ),
    ProductDataModel(
      id: 'apple_2',
      name: 'iPhone 16 Pro Max',
      image: 'assets/images/iphone_16_pro_max.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 1199.00,
      sizes: [
        '128 GB',
        '256 GB',
        '512 GB',
      ],
      colorVariants: [
        ColorVariantModel(
          colorName: 'Natural Titanium',
          colorCode: '#8E8E93',
          images: [
            'assets/images/iphone_16_pro_max.png',
            'assets/images/iphone_16_pro_max_back.png',
            'assets/images/iphone_16_pro_max_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Blue Titanium',
          colorCode: '#007AFF',
          images: [
            'assets/images/iphone_16_pro_max_blue.png',
            'assets/images/iphone_16_pro_max_blue_back.png',
            'assets/images/iphone_16_pro_max_blue_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'White Titanium',
          colorCode: '#F2F2F7',
          images: [
            'assets/images/iphone_16_pro_max_white.png',
            'assets/images/iphone_16_pro_max_white_back.png',
            'assets/images/iphone_16_pro_max_white_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Black Titanium',
          colorCode: '#1C1C1E',
          images: [
            'assets/images/iphone_16_pro_max_black.png',
            'assets/images/iphone_16_pro_max_black_back.png',
            'assets/images/iphone_16_pro_max_black_side.png',
          ],
        ),
      ],
    ),
    ProductDataModel(
      id: 'apple_3',
      name: 'iPhone 16',
      image: 'assets/images/iphone_16.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 799.00,
      sizes: [
        '128 GB',
        '256 GB',
        '512 GB',
      ],
      colorVariants: [
        ColorVariantModel(
          colorName: 'Pink',
          colorCode: '#FF69B4',
          images: [
            'assets/images/iphone_16_pink.png',
            'assets/images/iphone_16_pink_back.png',
            'assets/images/iphone_16_pink_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Blue',
          colorCode: '#007AFF',
          images: [
            'assets/images/iphone_16_blue.png',
            'assets/images/iphone_16_blue_back.png',
            'assets/images/iphone_16_blue_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Green',
          colorCode: '#34C759',
          images: [
            'assets/images/iphone_16_green.png',
            'assets/images/iphone_16_green_back.png',
            'assets/images/iphone_16_green_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Yellow',
          colorCode: '#FFD60A',
          images: [
            'assets/images/iphone_16_yellow.png',
            'assets/images/iphone_16_yellow_back.png',
            'assets/images/iphone_16_yellow_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Black',
          colorCode: '#1C1C1E',
          images: [
            'assets/images/iphone_16_black.png',
            'assets/images/iphone_16_black_back.png',
            'assets/images/iphone_16_black_side.png',
          ],
        ),
      ],
    ),
    ProductDataModel(
      id: 'apple_4',
      name: 'iPhone 16 Plus',
      image: 'assets/images/iphone_16_plus.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 899.00,
      sizes: [
        '128 GB',
        '256 GB',
        '512 GB',
      ],
    ),
    ProductDataModel(
      id: 'apple_5',
      name: 'iPhone 15',
      image: 'assets/images/iphone_15.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 699.00,
      sizes: [
        '128 GB',
        '256 GB',
        '512 GB',
      ],
    ),
    ProductDataModel(
      id: 'apple_6',
      name: 'iPhone 15 Plus',
      image: 'assets/images/iphone_15_plus.png',
      companyId: '1', // Apple
      category: 'Phone',
      price: 799.00,
      sizes: [
        '128 GB',
        '256 GB',
        '512 GB',
      ],
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
      colorVariants: [
        ColorVariantModel(
          colorName: 'Obsidian',
          colorCode: '#1C1C1E',
          images: [
            'assets/images/pixel9_obsidian.png',
            'assets/images/pixel9_obsidian_back.png',
            'assets/images/pixel9_obsidian_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Porcelain',
          colorCode: '#F2F2F7',
          images: [
            'assets/images/pixel9_porcelain.png',
            'assets/images/pixel9_porcelain_back.png',
            'assets/images/pixel9_porcelain_side.png',
          ],
        ),
        ColorVariantModel(
          colorName: 'Bay',
          colorCode: '#007AFF',
          images: [
            'assets/images/pixel9_bay.png',
            'assets/images/pixel9_bay_back.png',
            'assets/images/pixel9_bay_side.png',
          ],
        ),
      ],
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
    return allProducts
        .where((product) => product.companyId == companyId)
        .toList();
  }

  // Helper method to get products by category across all companies
  static List<ProductDataModel> getProductsByCategory(String category) {
    return allProducts
        .where((product) => product.category == category)
        .toList();
  }

  // Helper method to get products by company and category
  static List<ProductDataModel> getProductsByCompanyAndCategory(
    String companyId,
    String category,
  ) {
    return allProducts
        .where(
          (product) =>
              product.companyId == companyId && product.category == category,
        )
        .toList();
  }
}
