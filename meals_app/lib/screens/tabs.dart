import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

const initial_filters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class tabs_screen extends StatefulWidget {
  const tabs_screen({super.key});

  @override
  State<tabs_screen> createState() => _tabs_screenState();
}

class _tabs_screenState extends State<tabs_screen> {
  int _selectedpage_index = 0;

  final List<Meal> favoritesmeals = [];
  Map<Filter, bool> selected_filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void show_message(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void toggle_favorite_status(Meal meal) {
    final isExist = favoritesmeals.contains(meal);
    if (isExist) {
      setState(() {
        favoritesmeals.remove(meal);
        show_message("Meal removed from favorites");
      });
    } else {
      setState(() {
        favoritesmeals.add(meal);
        show_message("Meal added to favorites");
      });
    }
  }

  void _selectpage(int index) {
    setState(() {
      _selectedpage_index = index;
    });
  }

  void set_screen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => filters_screen(
            currentFilters: selected_filters,
          ),
        ),
      );
      setState(() {
        selected_filters = result ?? initial_filters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (selected_filters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selected_filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selected_filters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selected_filters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = categories_screen(
      ontooglefavorite: toggle_favorite_status,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedpage_index == 1) {
      activePage = meals_screen(
        meals: favoritesmeals,
        ontooglefavorite: toggle_favorite_status,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: main_drawer(
        onselect_screen: set_screen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpage_index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
