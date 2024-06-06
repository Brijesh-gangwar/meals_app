import 'package:meals_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsprovider = Provider((ref) {
  return dummyMeals;
});
