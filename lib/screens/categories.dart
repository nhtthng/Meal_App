import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/screens/meals.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2),lowerBound: 0, upperBound: 1);
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose(); // giúp giải phóng bộ nhớ khi không cần thiết
    super.dispose();
  }

  void _SelectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
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
    return  AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
        ),
      builder: (ctx, child) => Padding(padding: EdgeInsets.only(top:100 - _animationController.value * 100),child: child,)
    );
  }
}