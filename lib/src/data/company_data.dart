import 'package:tortoise/src/models/company_data_model.dart';
import 'product_data.dart';

class CompanyData {
  CompanyData._();

  static final List<CompanyDataModel> companyData = [
    CompanyDataModel(
      id: '1',
      name: 'Apple',
      image: 'assets/images/apple.png',
      products: ProductData.appleProducts, // All Apple products
    ),
    CompanyDataModel(
      id: '2',
      name: 'Google',
      image: 'assets/images/google.png',
      products: ProductData.googleProducts, // All Google products
    ),
    CompanyDataModel(
      id: '3',
      name: 'Samsung',
      image: 'assets/images/samsung.png',
      products: ProductData.samsungProducts, // All Samsung products
    ),
    CompanyDataModel(
      id: '4',
      name: 'OnePlus',
      image: 'assets/images/oneplus.png',
      products: ProductData.oneplusProducts, // All OnePlus products
    ),
  ];

  // Helper method to get company by ID
  static CompanyDataModel? getCompanyById(String id) {
    try {
      return companyData.firstWhere((company) => company.id == id);
    } catch (e) {
      return null;
    }
  }

  // Helper method to get company by name
  static CompanyDataModel? getCompanyByName(String name) {
    try {
      return companyData.firstWhere((company) => company.name.toLowerCase() == name.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  // Helper method to get all companies
  static List<CompanyDataModel> getAllCompanies() {
    return List.from(companyData);
  }

  // Helper method to get companies that have products in a specific category
  static List<CompanyDataModel> getCompaniesByProductCategory(String category) {
    return companyData.where((company) => 
      company.products.any((product) => product.category == category)
    ).toList();
  }

  // Helper method to get total number of products for a company
  static int getProductCountForCompany(String companyId) {
    final company = getCompanyById(companyId);
    return company?.products.length ?? 0;
  }

  // Helper method to get all unique categories across all companies
  static List<String> getAllProductCategories() {
    final categories = <String>{};
    for (final company in companyData) {
      categories.addAll(company.getProductCategories());
    }
    return categories.toList()..sort();
  }
}
