import 'package:flutter/material.dart';
import 'package:tp/AuthPage.dart';
import 'package:tp/models/add_new_meal_page.dart';
import 'package:tp/screens/details_page.dart';
import 'package:tp/screens/login_page.dart';
import 'package:tp/screens/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: AuthPage(),
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