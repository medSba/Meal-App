import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key,
    required this.meal,
    required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText{
    switch (meal.complexity){
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
          return 'Unknown';
    }
  }

  String get affordabilityText{
    switch (meal.affordability){
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                onSelectMeal(meal);
              },
              child: Stack(
                children: [
                  FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl)
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 40),
                        color: Colors.black38,
                        child: Column(
                          children: [
                            Text(meal.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.schedule),
                                    const SizedBox(width: 5,),
                                    Text('${meal.duration} min',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.work),
                                    const SizedBox(width: 5,),
                                    Text(complexityText,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.attach_money),
                                    const SizedBox(width: 5,),
                                    Text(affordabilityText,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
