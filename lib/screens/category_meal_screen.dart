import 'package:flutter/material.dart';
import 'package:meal_appp/providers/meal.dart';
import '../models/meal.dart';
import '../widget/meal_items.dart';
import 'package:provider/provider.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "Category_Meal";

  const CategoryMealScreen({  Key? key}) : super(key: key);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String argTitle='';
  List<Meal> categoryMeal=<Meal>[];

  @override
  void didChangeDependencies() {
    final List<Meal> selectedMeal =
        Provider
            .of<MealProvider>(context, listen: false)
            .availableMeal;
    final getArg =
    ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final argId = getArg["id"];
    argTitle = getArg["title"]!;
    categoryMeal =
        selectedMeal.where((meal) => meal.categories.contains(argId)).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal (String meaLId)=> setState(() {
  //     categoryMeal.removeWhere((removeId) => removeId.id==meaLId);
  //   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(argTitle),
        ),
        body: GridView.builder(
          itemBuilder: (ctx, index) =>
              MealItems(
                id: categoryMeal[index].id,
                title: categoryMeal[index].title,
                duration: categoryMeal[index].duration,
                imageUrl: categoryMeal[index].imageUrl,
                complexity: categoryMeal[index].complexity,
                affordability: categoryMeal[index].affordability,
              ),
          itemCount: categoryMeal.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio:  2.8/2 ,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
          ),
        ));
  }
}
