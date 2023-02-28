import 'package:flutter/material.dart';
import '../screens/meal_details_screeen.dart';
import './screens/categories_meals_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge: const TextStyle(
                    fontSize: 26,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
                titleMedium: const TextStyle(
                    fontSize: 24, fontFamily: 'RobotoCondensed'),
                titleSmall: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(20, 51, 51, 1)),
              ),
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      home: const CategoriesScreen(),
      routes: {
        CategoreisMealsScreen.routeName: (_) => const CategoreisMealsScreen(),
        MealDetailsScreen.routeName: (_) => const MealDetailsScreen()
      },
    );
  }
}
