import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tp/meal.dart';
import 'package:tp/models/day_meals.dart';
import 'package:tp/screens/ingList.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final receivedData = ModalRoute.of(context)?.settings.arguments as DayMeals;
    List<Meal> myListofMeals = receivedData.listOfMeals!;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Details page',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: myListofMeals.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Card(
              child: Column(
            children: [
              Text(myListofMeals[index].name!),
              Image.asset(
                myListofMeals[index].imgPath!,
                height: 60,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ingListPage(
                                    listOfIng:
                                        myListofMeals[index].listOfIngredient!,
                                  )),
                        );
                      },
                      icon: const Icon(Icons.visibility)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            ],
          ));
        },
      ),
    );
  }
}
