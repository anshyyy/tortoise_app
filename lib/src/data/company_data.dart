import 'package:tortoise/src/models/company_data.dart';

class CompanyData {
  CompanyData._();

  static final List<CompanyDataModel> companyData = [
    CompanyDataModel(
      id: '1',
      name: 'Apple',
      image: 'assets/images/apple.png',
    ),
    CompanyDataModel(
      id: '2',
      name: 'Google',
      image: 'assets/images/google.png',
    ),
    CompanyDataModel(
      id: '3',
      name: 'Samsung',
      image: 'assets/images/samsung.png',
    ),
    CompanyDataModel(
      id: '4',
      name: 'OnePlus',
      image: 'assets/images/oneplus.png',
    ),
  ];
}
