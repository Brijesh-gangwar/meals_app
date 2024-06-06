import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class filternotifiers extends StateNotifier<Map<Filter, bool>> {
  filternotifiers()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
  void set_filters(Map<Filter, bool> chosenfilters) {
    state = chosenfilters;
  }

  void set_filter(Filter filter, bool isacitve) {
    state = {
      ...state,
      filter: isacitve,
    };
  }
}

final filterprovider =
    StateNotifierProvider<filternotifiers, Map<Filter, bool>>(
        (ref) => filternotifiers());

final filtered_meals_provider = Provider((ref) {
  final meals = ref.watch(mealsprovider);

  final activefilters = ref.watch(filterprovider);
  return meals.where((meal) {
    if (activefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
