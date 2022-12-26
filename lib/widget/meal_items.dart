import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/meal.dart';
import '../providers/language_provider.dart';
import '../screens/meal_details_screen.dart';

class MealItems extends StatelessWidget {
  final String title;
  final String id;
  final int duration;
  String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  MealItems({Key? key,

    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key) ;

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "simple";
        break;
      case Complexity.hard:
        return "Hard";
        break;
      case Complexity.challenging:
        return "Challenging";
        break;
      default:
        return "UnKnown";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.pricey:
        return "pricey";
        break;
      case Affordability.affordable:
        return "affordable";
        break;
      case Affordability.luxurious:
        return "luxurious";
        break;
      default:
        return "UnKnown";
        break;
    }
  }

  void selectToDisMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetail.routeName, arguments: id)
        .then((value) {
      // if (value != null) removeItems(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectToDisMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -3,
                  right: 10,
                  left: 10,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    width: 350,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 24, color: Colors.cyan),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Theme.of(context).buttonColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Theme.of(context).buttonColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Theme.of(context).buttonColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
