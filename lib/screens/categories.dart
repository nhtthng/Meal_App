import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/screens/meals.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;
  void _SelectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
          children: [
            // vòng for này thay thế cho map như sau: availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            for (final category in availableCategories)
              CategoryGridItem(category: category, onSelectCategory: () {
                _SelectCategory(context, category);
              })
          ],
      );
  }
}