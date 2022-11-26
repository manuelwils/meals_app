import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

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
            return MealItem(
                id: categoryMeals[index].id,
                categories: categoryMeals[index].categories,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
