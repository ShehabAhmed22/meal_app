import 'package:flutter/material.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;

  final String title;

  final String imageUrl;

  final int duration;

  final List<String> list;
  final List<String> steps;
  final List<String> ingredients;
  final List<String> categories;

  final Complexity complexity;

  final Affordability affordability;

  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
     required this.isGlutenFree,
     required this.isLactoseFree,
     required this.isVegan,
     required this.isVegetarian,
     required this.complexity,
     required this.affordability,
     required this.id,
     required this.title,
     required this.imageUrl,
     required this.duration,
     required this.list,
     required this.steps,
     required this.ingredients,
     required this.categories,
  });
}
