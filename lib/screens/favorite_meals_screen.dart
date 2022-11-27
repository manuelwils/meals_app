import 'package:flutter/material.dart';

class FavoriteMealsScreen extends StatelessWidget {
  const FavoriteMealsScreen({Key? key}) : super(key: key);

  static const String routeName = '/favorite-meals';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorite Meals'),
    );
  }
}
