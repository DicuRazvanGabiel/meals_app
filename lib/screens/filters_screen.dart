import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> _filters;
  const FiltersScreen(this.saveFilters, this._filters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget._filters['gluten'] as bool;
    _isVegan = widget._filters['vegan'] as bool;
    _isVegetarian = widget._filters['vegetarian'] as bool;
    _isLactoseFree = widget._filters['lactose'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _isGlutenFree,
                onChanged: (val) => setState(() {
                  _isGlutenFree = val;
                }),
                title: const Text('Gluten-free'),
                subtitle: const Text('Only include gluten-free meals.'),
              ),
              SwitchListTile(
                value: _isVegan,
                onChanged: (val) => setState(() {
                  _isVegan = val;
                }),
                title: const Text('Vegan'),
                subtitle: const Text('Only include vegan meals.'),
              ),
              SwitchListTile(
                value: _isVegetarian,
                onChanged: (val) => setState(() {
                  _isVegetarian = val;
                }),
                title: const Text('Vegetarian'),
                subtitle: const Text('Only include Vegetarian meals.'),
              ),
              SwitchListTile(
                value: _isLactoseFree,
                onChanged: (val) => setState(() {
                  _isLactoseFree = val;
                }),
                title: const Text('Lactose-free'),
                subtitle: const Text('Only include Lactose-free meals.'),
              )
            ],
          ))
        ],
      ),
    );
  }
}
