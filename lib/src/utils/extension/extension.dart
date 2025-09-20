import 'package:intl/intl.dart';

/// Extension on double to format numbers according to Indian numbering system
extension IndianCurrencyFormatting on double {
  /// Formats number according to Indian numbering system (lakhs and crores)
  /// Uses NumberFormat from intl package for proper Indian locale formatting
  String toIndianCurrency() {
    // Create NumberFormat for Indian locale (en_IN)
    final formatter = NumberFormat('#,##,##,##,##0', 'en_IN');
    
    // Format the number according to Indian numbering system
    return formatter.format(this);
  }
  
  /// Formats number as currency with Indian Rupee symbol
  /// Uses NumberFormat from intl package for proper currency formatting
  String toIndianCurrencyWithSymbol() {
    // Create NumberFormat for Indian currency
    final formatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 0,
    );
    
    return formatter.format(this);
  }
}