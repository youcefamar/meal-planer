// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp/my_button.dart';
import 'package:tp/my_textfield.dart';

class LoginPage extends StatelessWidget {
  GlobalKey<FormState> myFormState = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();
  void _Signin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: "myEmail", password: "myPWD");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('Invalid Email');
      } else if (e.code == 'invalid-credential') {
        print('user-not-found OR Wrong Password');
      } else {
        print('Failed to login with error code: ${e.code}, ${e.message}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: myFormState,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Welcome to my App",
                    style: TextStyle(color: Colors.black, fontSize: 26)),
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/chef.png'),
                  radius: 75,
                ),
                const SizedBox(
                  height: 75,
                ),
                MyTextField(
                  myHintText: "Username",
                  isObscure: false,
                  myController: _emailcontroller,
                  myIcon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                  myHintText: "Password",
                  isObscure: true,
                  myController: _passwordcontroller,
                  myIcon: const Icon(Icons.lock),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    myButtonLabel: "login",
                    MyOnpressedFct: () {
                      if (myFormState.currentState!.validate()) {
                        print("Valide");

                        Navigator.pushNamed(context, 'Home_page');
                      } else {
                        print("Not Valide");
                      }
                    }),
                const SizedBox(
                  height: 100,
                ),
                MyTextButton(
                    myButtonlabel: "Forgot you're password?",
                    MyOnpressedFct: () {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    MyTextButton(
                        myButtonlabel: "SignUp",
                        MyOnpressedFct: () {
                          _Signin();
                          Navigator.pushNamed(context, 'Sign_page');
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
