import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_provider.dart';

class meal_details_screen extends ConsumerWidget {
  const meal_details_screen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite_meals = ref.watch(favoriteprovider);

    final isfavorite = favorite_meals.contains(meal);
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
                final isadded = ref
                    .read(favoriteprovider.notifier)
                    .togglemeal_favoritestatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isadded
                        ? 'meal added to favorites'
                        : 'meal removed from favorites'),
                  ),
                );
              },
              icon: AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 300,
                ),
                child: Icon(
                  isfavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isfavorite),
                ),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns:
                        Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
