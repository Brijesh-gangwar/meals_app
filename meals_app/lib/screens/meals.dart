import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';
import 'meal_details_screen.dart';

class meals_screen extends StatelessWidget {
  const meals_screen({super.key, this.title, required this.meals, required this.ontooglefavorite});

  final String? title;
  final List<Meal> meals;
    final void Function(Meal meal) ontooglefavorite;


  void select_meal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => meal_details_screen(meal: meal,ontooglefavorite: ontooglefavorite,),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        "try selecting different category",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => meal_item(
          meal: meals[index],
          onselect_meal: (meal) {
            select_meal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
