import 'package:flutter/material.dart';
import '../../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = '/meal-details';
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    Widget buildSectionTitle(String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 350,
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl, fit: BoxFit.cover),
          ),
          buildSectionTitle('Ingredients:'),
          buildContainer(
            ListView.builder(
              itemBuilder: (_, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(meal.ingredients[index]),
                ),
              ),
              itemCount: meal.ingredients.length,
            ),
          ),
          buildSectionTitle('Steps:'),
          buildContainer(
            ListView.builder(
              itemBuilder: (_, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}')),
                  title: Text(meal.steps[index]),
                ),
                const Divider()
              ]),
              itemCount: meal.steps.length,
            ),
          ),
        ]),
      ),
    );
  }
}
