import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_details_screeen.dart';
import './screens/categories_meals_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterdData) {
    setState(() {
      _filters = filterdData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] as bool && !element.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] as bool && !element.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] as bool && !element.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

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
      home: const TabsScreen(),
      routes: {
        CategoreisMealsScreen.routeName: (_) =>
            CategoreisMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (_) => const MealDetailsScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(_setFilters, _filters)
      },
    );
  }
}
