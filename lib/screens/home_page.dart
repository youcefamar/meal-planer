import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:tp/models/day_meals.dart';
import 'package:tp/models/days_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DayMeals> dayslist = [
    DayMeals(day: 'Saturday', listOfMeals: []),
    DayMeals(day: 'Sunday', listOfMeals: []),
    DayMeals(day: 'Monday', listOfMeals: []),
    DayMeals(day: 'Tuesday', listOfMeals: []),
    DayMeals(day: 'Wedneday', listOfMeals: []),
    DayMeals(day: 'Thurstday', listOfMeals: []),
    DayMeals(day: 'Friday', listOfMeals: [])
  ];
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                Navigator.pushNamed(context, 'Login_Page');
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                Navigator.pushNamed(context, 'Login_Page');
              },
              icon: Icon(Icons.outbond))
        ],
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(),
        ),
      ),
      body: ListView.builder(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: dayslist.length,
        itemBuilder: (context, index) => DayCard(
            dayAndItsMealsList: DayMeals(
                day: dayslist[index].day,
                listOfMeals: dayslist[index].listOfMeals)),
      ),
    );
  }
}
