// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tp/my_button.dart';
import 'package:tp/my_textfield.dart';

class LoginPage extends StatelessWidget {
  GlobalKey<FormState> myFormState = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

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
                  myHintText: "Email",
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
                    MyOnpressedFct: () async {
                      if (_emailcontroller.text != '') {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailcontroller.text,
                                  password: _passwordcontroller.text);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                        Navigator.pushNamed(context, 'Home_page');
                        _emailcontroller.clear();
                        _passwordcontroller.clear();
                      } else {
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.leftSlide,
                                title: 'error',
                                desc: 'entre your email and password')
                            .show();
                      }
                    }),
                const SizedBox(
                  height: 100,
                ),
                MyTextButton(
                    myButtonlabel: "Forgot you're password?",
                    MyOnpressedFct: () async {
                      if (_emailcontroller.text == "") {
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.leftSlide,
                                title: 'error',
                                desc:
                                    'entre your email first to reset your password')
                            .show();
                      } else {
                        try {
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _emailcontroller.text);
                        } catch (e) {
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.leftSlide,
                                  title: 'error',
                                  desc:
                                      'the email is not valid please check it again')
                              .show();
                        }
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.leftSlide,
                                title: 'Success',
                                desc:
                                    'Please check your email for rest your password')
                            .show();
                      }
                    }),
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
                          Navigator.pushReplacementNamed(context, 'Sign_page');
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
