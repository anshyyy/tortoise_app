/// Asset constants for managing all app assets
/// 
/// This class provides centralized access to all asset paths in the application.
/// It follows the singleton pattern with a private constructor to prevent instantiation.
class AssetConstants {
  AssetConstants._();

  // Folder paths
  static const String _vectorFolder = 'assets/vectors/';
  static const String _imageFolder = 'assets/images/';

  // Vector assets
  static const String caretLeftIcon = '${_vectorFolder}caret-left.svg';
  static const String searchIcon = '${_vectorFolder}search.svg';

  // Image assets - Device images
  static const String ipadPro = '${_imageFolder}ipad_pro.png';
  static const String ipad = '${_imageFolder}ipad.png';
  static const String iphone15Plus = '${_imageFolder}iphone_15_plus.png';
  static const String iphone15 = '${_imageFolder}iphone_15.png';
  static const String iphone16Plus = '${_imageFolder}iphone_16_plus.png';
  static const String iphone16ProMax = '${_imageFolder}iphone_16_pro_max.png';
  static const String iphone16Pro = '${_imageFolder}iphone_16_pro.png';
  static const String iphone16 = '${_imageFolder}iphone_16.png';
  static const String macbookAir = '${_imageFolder}macbook_air.png';
  static const String macbook = '${_imageFolder}macbook.png';

}