import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp/screens/home_page.dart';
import 'package:tp/screens/login_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyHomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
