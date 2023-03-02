import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Cooking Up',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          leading: const Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: const Text(
            'Meals',
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
          leading: const Icon(
            Icons.settings,
            size: 26,
          ),
          title: const Text(
            'Filters',
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]),
    );
  }
}
