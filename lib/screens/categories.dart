import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => MealsScreen(meals: filteredMeals, title: category.title)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 3/2, 
          crossAxisSpacing: 20, 
          mainAxisSpacing: 20
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category, onSelectedCategory: () {
              _selectedCategory(context, category);
            },)
        ],
      );
  }
}