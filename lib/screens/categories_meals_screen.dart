import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoreisMealsScreen extends StatelessWidget {
  final List<Meal> _availableMeals;
  const CategoreisMealsScreen(this._availableMeals, {super.key});
  static const String routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filteredMeals = _availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            final meal = filteredMeals[index];
            return MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability);
          },
          itemCount: filteredMeals.length,
        ));
  }
}
