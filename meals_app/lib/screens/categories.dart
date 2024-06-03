import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class categories_screen extends StatelessWidget {
  const categories_screen({super.key});

  void _selectcategory(BuildContext context, Category category) {
    final filter_meals_list = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return meals_screen(title: category.title, meals: filter_meals_list);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pick your category"),
      ),
      body: GridView(
        padding: EdgeInsets.all(16),
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
      ),
    );
  }
}
