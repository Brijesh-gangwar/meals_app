import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class favoritemeal_notifiers extends StateNotifier<List<Meal>> {
  favoritemeal_notifiers() : super([]);

  bool togglemeal_favoritestatus(Meal meal) {
    final isfavorite = state.contains(meal);

    if (isfavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteprovider =
    StateNotifierProvider<favoritemeal_notifiers, List<Meal>>((ref) {
  return favoritemeal_notifiers();
});
