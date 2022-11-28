import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen({Key? key}) : super(key: key);
  static String routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget _buildFilterOptions(
      String title, String subtitle, bool currentValue, Function callback) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: (newValue) => callback(newValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Set filters for your meals!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildFilterOptions(
                  'Gluten Free',
                  'Allow only glutten free meals',
                  _glutenFree,
                  (newValue) => setState(() => _glutenFree = newValue),
                ),
                _buildFilterOptions(
                  'Lactose Free',
                  'Allow only lactose free meals',
                  _lactoseFree,
                  (newValue) => setState(() => _lactoseFree = newValue),
                ),
                _buildFilterOptions(
                  'Vegan',
                  'Allow only vegan meals',
                  _vegan,
                  (newValue) => setState(() => _vegan = newValue),
                ),
                _buildFilterOptions(
                  'Vegetarian',
                  'Allow only vegetarian free meals',
                  _vegetarian,
                  (newValue) => setState(() => _vegetarian = newValue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
