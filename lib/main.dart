import 'package:flutter/material.dart';

import './models/meal.dart';
import './screens/meal_detail.dart';
import './screens/filters_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tabs_screen.dart';
import './dummy_meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  final List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filters) {
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => const TabsScreen(),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(meals: _availableMeals),
        MealDetailScreen.routeName: (_) => const MealDetailScreen(),
        FiltersScreen.routeName: (_) => const FiltersScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'OmaMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
    );
  }
}
