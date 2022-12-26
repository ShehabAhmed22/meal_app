import 'package:flutter/material.dart';
import 'package:meal_appp/providers/meal.dart';
import '../widget/category_items.dart';
import 'package:provider/provider.dart';



class CategoryScreen extends StatelessWidget {
  const CategoryScreen({  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        children:  Provider.of<MealProvider>(context).availableCategory
            .map((catData) =>
                CategoryItems(catData.id, catData.title, catData.color))
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
