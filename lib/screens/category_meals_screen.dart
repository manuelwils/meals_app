import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';
import '../dummy_meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal>? categoryMeals;
  String? categoryTitle;
  bool dependencyChanged = false;

  @override
  void didChangeDependencies() {
    if (!dependencyChanged) {
      final Map args =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      final String categoryId = args['id'];
      categoryTitle = args['title'];

      categoryMeals = dummyMeals
          .where((meal) => meal.categories!.contains(categoryId))
          .toList();
      dependencyChanged = true;
    }
    super.didChangeDependencies();
  }

  void deleteMeal(mealId) {
    setState(() {
      categoryMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals![index].id,
              categories: categoryMeals![index].categories,
              title: categoryMeals![index].title,
              imageUrl: categoryMeals![index].imageUrl,
              duration: categoryMeals![index].duration,
              complexity: categoryMeals![index].complexity,
              affordability: categoryMeals![index].affordability,
              deleteMeal: deleteMeal,
            );
          },
          itemCount: categoryMeals!.length,
        ));
  }
}
