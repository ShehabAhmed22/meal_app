import 'package:flutter/material.dart';
import 'package:meal_appp/providers/meal.dart';
import '../dummy_data.dart';
import 'package:provider/provider.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = "MealDetails";

  const MealDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getId = ModalRoute.of(context)!.settings.arguments;
    final showDetail = dummyMeals.firstWhere((detail) => detail.id == getId);

    var liSteps = ListView.builder(
      itemCount: showDetail.steps.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text(
                "${index + 1}",
              ),
            ),
            title: Text(showDetail.steps[index],
                style: const TextStyle(color: Colors.black)),
          ),
          const Divider(
            color: Colors.pink,
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(showDetail.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              showDetail.imageUrl,
              fit: BoxFit.fill,
            ),
            buildContainerTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemCount: showDetail.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      showDetail.ingredients[index],
                      style: TextStyle(
                          color: Theme.of(context).accentColor !=null
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            buildContainerTitle(context, "Steps"),
            buildContainer(
              liSteps
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<MealProvider>(context, listen: false)
            .toggleFavorite("$getId"),
        child: Icon(
            Provider.of<MealProvider>(context, listen: true).isFave("$getId")
                ? Icons.favorite
                : Icons.favorite_border),
      ),
    );
  }

  Container buildContainer(child) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white60),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(3),
      height: 200,
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: child,
    );
  }

  Container buildContainerTitle(BuildContext context, String text) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
