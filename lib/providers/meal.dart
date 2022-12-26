import 'package:flutter/cupertino.dart';
import 'package:meal_appp/models/meal.dart';
import '../dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> availableMeal = dummyMeals;
  final List<Meal> favoriteMeal = [];

  void toggleFavorite(String mealId) {
    final faveIndex = favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (faveIndex >= 0) {
      favoriteMeal.removeAt(faveIndex);
    } else {
      favoriteMeal.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
    }
    notifyListeners();
  }

  isFave(String id) => favoriteMeal.any((meal) => meal.id == id);


  List <Category>availableCategory= dummyCategories;

  void setFilters() async {
    availableMeal = dummyMeals.where((meal) {
      if (filters["gluten"]! && !meal.isGlutenFree) {
        return false;
      }
      if (filters["lactose"]! && !meal.isLactoseFree) {
        return false;
      }
      if (filters["vegan"]! && !meal.isVegan) {
        return false;
      }
      if (filters["vegetarian"]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    List <Category>ac=[];

    availableMeal.forEach((meal) {
      meal.categories.forEach((catId) {
        dummyCategories.forEach((category) {
          if(category.id==catId){
            if(!ac.any((category) => category.id==catId)) ac.add(category);
          }
        });
      });
    });
    availableCategory=ac;
    notifyListeners();

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("gluten", filters["gluten"]!);
    pref.setBool("lactose", filters["lactose"]!);
    pref.setBool("vegan", filters["vegan"]!);
    pref.setBool("vegetarian", filters["vegetarian"]!);
  }

  void getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    filters["gluten"]= pref.getBool("gluten")??false;
    filters["gluten"]= pref.getBool("lactose")??false;
    filters["gluten"]= pref.getBool("vegan")??false;
    filters["gluten"]= pref.getBool("vegetarian")??false;
    notifyListeners();
  }
}
