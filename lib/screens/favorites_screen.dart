import 'package:flutter/material.dart';
import 'package:meal_appp/providers/meal.dart';
import '../widget/meal_items.dart';
import '../models/meal.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
   final  List<Meal> favoriteMeal=Provider.of<MealProvider>(context,listen: false).favoriteMeal;
   if (favoriteMeal.isEmpty){
      return const Center(
        child: Text ("You have No Favorite yet - Start adding some"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) =>
            MealItems(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              duration: favoriteMeal[index].duration,
              imageUrl: favoriteMeal[index].imageUrl,
              complexity: favoriteMeal[index].complexity,
              affordability: favoriteMeal[index].affordability,

            ),
        itemCount: favoriteMeal.length,
      );
    }
  }
}
