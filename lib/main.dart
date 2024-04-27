import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tp/meal.dart';
import 'package:tp/models/add_new_meal_page.dart';
import 'package:tp/models/day_meals.dart';
import 'package:tp/screens/details_page.dart';
import 'package:tp/screens/login_page.dart';
import 'package:tp/screens/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MealAdapter());
  Hive.registerAdapter(DayMealsAdapter());

  //var mybox = await Hive.openBox<DayMeals>('DayMeals');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=============User is currently signed out!');
      } else {
        print('************User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Meal Planner',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? LoginPage()
          : MyHomePage(),
      routes: {
        'DetailsPage': (contex) => DetailsPage(),
        'AddMealPage': (contex) => AddNewMealPage(),
        'Login_Page': (contex) => LoginPage(),
        'Sign_page': (contex) => SignUp(),
        'Home_page': (contex) => const MyHomePage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Meal Planner ',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: LoginPage(),
      routes: {
        'DetailsPage': (contex) => DetailsPage(),
        'AddMealPage': (contex) => AddNewMealPage(),
        'Login_Page': (contex) => LoginPage(),
        'Sign_page': (contex) => SignUp(),
        'Home_page': (contex) => const MyHomePage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
*/