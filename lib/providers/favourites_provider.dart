import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);
  void toggleFavourite(Meal meal){
    final isExisting = state.contains(meal);
    if(isExisting){
      state = state.where((element) => element.id != meal.id).toList();
    }
    else{
      state = [...state, meal];
    }
  }
}
final FavouriteMealsProvider = StateNotifierProvider<FavouriteMealNotifier,List<Meal>>((ref){
  return FavouriteMealNotifier();
});