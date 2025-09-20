import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tortoise/src/models/product_data_model.dart';
import 'package:tortoise/src/screens/home/home_screen.dart';
import 'package:tortoise/src/screens/product/product_screen.dart';
import 'package:tortoise/src/screens/search/search_screen.dart';

/// Route name enum with path constants
enum RouteNameEnum {
  home('/'),
  product('/product'),
  search('/search');

  const RouteNameEnum(this.path);
  final String path;

  /// Get route enum from settings name
  static RouteNameEnum routeFromSettings(String name) {
    return RouteNameEnum.values.firstWhere(
      (value) => name == value.path,
      orElse: () => RouteNameEnum.home,
    );
  }
}

/// Router class using page_transition package
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routes = RouteNameEnum.routeFromSettings(settings.name ?? '');

    return switch (routes) {
      RouteNameEnum.home => PageTransition(
        child: const HomeScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 400),
      ),
      RouteNameEnum.product => PageTransition(
        child: ProductScreen(product: settings.arguments as ProductDataModel),
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 300),
      ),
      RouteNameEnum.search => PageTransition(
        child: const SearchScreen(),
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 300),
      ),
    };
  }
}
