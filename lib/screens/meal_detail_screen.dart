import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key,
    required this.meal,
    required this.onToggleFav});

  final Meal meal;
  final void Function(Meal meal) onToggleFav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFav(meal);
          },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,),
            const SizedBox(height: 12,),
            Text('Ingredients',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),),
            const SizedBox(height: 12,),
            for(final ingredient in meal.ingredients)
              Text(ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
            const SizedBox(height: 24,),
            Text('Steps',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),),
            const SizedBox(height: 12,),
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6
                ),
                child: Text(step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),),
              ),
          ],
        ),
      ),
    );
  }
}
