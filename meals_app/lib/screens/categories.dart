import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/meal.dart';

class categories_screen extends StatelessWidget {
  const categories_screen({super.key, required this.ontooglefavorite, required this.availableMeals});
  final void Function(Meal meal) ontooglefavorite;

  final List<Meal> availableMeals;

  void _selectcategory(BuildContext context, Category category) {
    final filterMealsList = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return meals_screen(
            title: category.title,
            meals: filterMealsList,
            ontooglefavorite: ontooglefavorite,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          category_grid_item(
            category: category,
            onselectcategory: () {
              _selectcategory(context, category);
            },
          )
      ],
    );
  }
}
