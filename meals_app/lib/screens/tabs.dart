import 'package:flutter/material.dart';
import 'package:meals_app/providers/favorite_provider.dart';
import 'package:meals_app/providers/filter_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const initial_filters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class tabs_screen extends ConsumerStatefulWidget {
  const tabs_screen({super.key});

  @override
  ConsumerState<tabs_screen> createState() => _tabs_screenState();
}

class _tabs_screenState extends ConsumerState<tabs_screen> {
  int _selectedpage_index = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedpage_index = index;
    });
  }

  void set_screen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const filters_screen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filtered_meals_provider);
    Widget activePage = categories_screen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedpage_index == 1) {
      final favoritesmeals = ref.watch(favoriteprovider);

      activePage = meals_screen(
        meals: favoritesmeals,
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
