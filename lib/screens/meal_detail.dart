import 'package:flutter/material.dart';

import '../dummy_meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    Widget buildSubHeading(BuildContext context, String heading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          heading,
          style: Theme.of(context).textTheme.headline1,
        ),
      );
    }

    Widget buildItemCard(
        {@required BuildContext? context, @required Widget? child}) {
      return Container(
        height: 150,
        width: 300,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: child,
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade50,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    selectedMeal.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              buildSubHeading(context, 'Ingredients'),
              buildItemCard(
                context: context,
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients!.length,
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients![index],
                      ),
                    ),
                  ),
                ),
              ),
              buildSubHeading(context, 'Steps'),
              buildItemCard(
                context: context,
                child: ListView.builder(
                  itemCount: selectedMeal.steps!.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text('# ${selectedMeal.steps![index]}'),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pop(mealId),
          child: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
