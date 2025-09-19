import 'package:flutter/material.dart';
import 'package:tortoise/src/routes/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tortoise'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: MaterialButton(
          height: 50,
          minWidth: 200,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RouteNameEnum.search.path);
          },
          child: const Text('Search', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
