import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,
    required this.onToggleFav});

  final void Function(Meal meal) onToggleFav;

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3/2),
      children: [
        for(final category in availableCategories)
          CategoryGridItem(category: category, onToggleFav:onToggleFav,)
      ],);
  }
}
