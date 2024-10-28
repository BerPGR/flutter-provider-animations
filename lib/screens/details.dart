import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favoriteMeals = ref.watch(favoritesMealProvider);

    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref.read(favoritesMealProvider.notifier).toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded ? 'Meal Added' : 'Meal removed')
                )
              );
            }, 
            icon: Icon(isFavorite ? Icons.star: Icons.star_border)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover,),
            const SizedBox(height: 14,),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            )),
            const SizedBox(height: 14,),
            for (final ingredient in meal.ingredients)
              Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            )),
            const SizedBox(height: 24,),
            Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 14,),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Text(step, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
                          )),
              ),
          ]
        ),
      )
    );
  }
}