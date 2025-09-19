import 'package:flutter/material.dart';
import 'package:tortoise/src/routes/router.dart';
import 'package:tortoise/src/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tortoise',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      // Use named routing with page transitions
      initialRoute: RouteNameEnum.home.path,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
