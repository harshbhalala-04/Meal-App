import 'package:Meal_App/screens/drawer_screen.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var vegitarien = false;
  var vegan = false;
  var lactoseFree = false;

  @required
  initState() {
    glutenFree = widget.currentFilters['gluten'];
    lactoseFree = widget.currentFilters['lactose'];
    vegitarien = widget.currentFilters['vegetarian'];
    vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, bool currentValue,
      String description, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegitarien,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.title,
              )),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-Free',
                  glutenFree,
                  'Only Include Gluten-Free meals.',
                  (newValue) {
                    setState(() {
                        glutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  lactoseFree,
                  'Only Include Lactose-Free meals.',
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegeterian',
                  vegitarien,
                  'Only Include Vegeterian meals.',
                  (newValue) {
                    setState(() {
                      vegitarien = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  vegan,
                  'Only Include Vegan meals.',
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
