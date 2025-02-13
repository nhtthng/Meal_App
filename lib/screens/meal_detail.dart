import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body:
       SingleChildScrollView(
         child: Column( // cần wrap column này trong singleChildScrollView để tránh trường hợp bị overflow hoặc sử dụng ListView thay vì Column
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
          meal.imageUrl,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
          const SizedBox(height: 14,),
           Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
           ),),
           const SizedBox(height: 14,),
           for (final ingredient in meal.ingredients)
            Text(ingredient,style: TextStyle(color: Colors.white),),
         
            const SizedBox(height: 24,),
            Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 14,),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Text(step,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
              ),
          ]
         ),
       )
       
    );
  }
}