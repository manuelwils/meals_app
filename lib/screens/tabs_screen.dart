import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import './categories_screens.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'route': const CategoriesScreen(),
      'title': 'OmaMeals',
    },
    {
      'route': const FavoriteScreen(),
      'title': 'Your Favorite',
    }
  ];

  int _currentPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentPageIndex]['title'].toString()),
      ),
      drawer: const MainDrawer(),
      body: _pages[_currentPageIndex]['route'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _currentPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
