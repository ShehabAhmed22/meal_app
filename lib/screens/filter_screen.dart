import 'package:flutter/material.dart';
import 'package:meal_appp/providers/meal.dart';
import 'package:meal_appp/providers/themes_provider.dart';
import '../widget/main_drawer.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  static const routName = "SettingScreen";

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function (bool) updateValue ) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
      inactiveTrackColor:
          Provider.of<ThemesProvider>(context).tm == ThemeMode.light
              ? null
              : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> _currentFilter =
        Provider.of<MealProvider>(context, listen: true).filters;
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Your Filters"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    "Gluten_Free",
                    "Only include gluten_free meals",
                    _currentFilter["gluten"]!,
                    (newValue) => setState(() {
                          _currentFilter["gluten"] = newValue;
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        })),
                buildSwitchListTile(
                    "lactose_Free",
                    "Only include lactose_Free meals",
                    _currentFilter["lactose"]!,
                    (newValue) => setState(() {
                          _currentFilter["lactose"] = newValue;
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        })),
                buildSwitchListTile(
                    "Vegetarian",
                    "Only include Vegetarian meals",
                    _currentFilter["vegetarian"]!,
                    (newValue) => setState(() {
                          _currentFilter["vegetarian"] = newValue;
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        })),
                buildSwitchListTile(
                    "vegan ",
                    "Only include vegan  meals",
                    _currentFilter["vegan"]!,
                    (newValue) => setState(() {
                          _currentFilter["vegan"] = newValue;
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        })),
              ],
            ),
          ),
        ],
      ),
      drawer:   MainDrawer(),
    );
  }
}
