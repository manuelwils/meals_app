import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String id = args['id'];
    final String title = args['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('You\'re viewing the $title page'),
      ),
    );
  }
}
