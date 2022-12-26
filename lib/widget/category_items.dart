import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';


class CategoryItems extends StatelessWidget {
  final String id;

  final String title;

  final Color color;

  const CategoryItems(this.id, this.title, this.color,);

  selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {
           "id": id,
           "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.3), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
