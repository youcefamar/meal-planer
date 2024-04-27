// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tp/meal.dart';
import 'package:tp/models/day_meals.dart';

class DayCard extends StatelessWidget {
  DayMeals dayAndItsMealsList;

  DayCard({required this.dayAndItsMealsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                dayAndItsMealsList.day!,
                style: const TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                    fontSize: 17),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    //final DayMeals dayMeals = mybox.get('daymeals');
                    //dayAndItsMealsList = dayMeals;

                    Navigator.pushNamed(context, 'DetailsPage',
                        arguments: dayAndItsMealsList);
                  },
                  child: const Icon(
                    Icons.visibility,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () async {
                    Meal? _meal =
                        await Navigator.pushNamed(context, 'AddMealPage')
                            as Meal?;
                    if (_meal != null) {
                      dayAndItsMealsList.listOfMeals?.add(_meal);
                    }
                    var mybox = await Hive.openBox<DayMeals>('daymeals');

                    DayMeals dayMeals1 = DayMeals(
                        day: dayAndItsMealsList.day,
                        listOfMeals: dayAndItsMealsList.listOfMeals);
                    mybox.add(dayMeals1);
                    dayMeals1.save();

                    //mybox.put('day', dayAndItsMealsList.day);
                    //mybox.put('MealList', dayAndItsMealsList.listOfMeals!);
                    //print(mybox.get('day'));

                    //List<Meal> list = mybox.get('MealList');
                    //print(list);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
