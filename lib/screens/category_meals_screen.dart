import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String categoryId = args['id'];
    final String categoryTitle = args['title'];

    final List<Meal> categoryMeals = dummyMeals
        .where((meal) => meal.categories!.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text(categoryMeals[index].title!);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
