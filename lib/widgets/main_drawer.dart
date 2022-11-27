import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  void navigateTo(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  Widget buildNavItems(IconData icon, String title, dynamic tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Center(
              child: Text(
                'Cooking UP!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          buildNavItems(
            Icons.restaurant,
            'Meals',
            () {
              navigateTo(context, '/');
            },
          ),
          buildNavItems(
            Icons.settings,
            'Filters',
            () {
              navigateTo(context, FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
