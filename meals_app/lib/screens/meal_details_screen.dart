import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class meal_details_screen extends StatelessWidget {
  const meal_details_screen(
      {super.key, required this.meal, required this.ontooglefavorite});

  final Meal meal;
  final void Function(Meal meal) ontooglefavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            meal.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                ontooglefavorite(meal);
              },
              icon: const Icon(Icons.star),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: NetworkImage(meal.imageUrl),
              ),
              const Text(
                "Indredinets",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                ),
              ),
              for (var value in meal.ingredients)
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              const Text(
                "steps",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                ),
              ),
              for (var value in meal.steps)
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ));
  }
}
