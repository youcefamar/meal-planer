// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tp/my_button.dart';
import 'package:tp/my_textfield.dart';

class SignUp extends StatelessWidget {
  GlobalKey<FormState> myFormState = GlobalKey<FormState>();
  TextEditingController _emailConroller = TextEditingController();
  TextEditingController _passwordConroller = TextEditingController();
  TextEditingController _ConfirmePasswordConroller = TextEditingController();

  Future<void> _register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailConroller.text, password: _passwordConroller.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('Account already exists for that email');
      } else {
        print('Failed to signup: error code: ${e.code}, ${e.message}');
      }
    }
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: myFormState,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Create your account",
                  style: TextStyle(fontSize: 32),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    myHintText: "Username",
                    isObscure: false,
                    myController: TextEditingController(),
                    myIcon: const Icon(Icons.person)),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                    myHintText: "Email",
                    isObscure: false,
                    myController: _emailConroller,
                    myIcon: const Icon(Icons.email),
                    myValidator: null),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                  myHintText: "Password",
                  isObscure: false,
                  myController: _passwordConroller,
                  myIcon: const Icon(Icons.lock),
                  myValidator: null,
                ),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                  myHintText: "Confirme Password",
                  isObscure: false,
                  myController: _ConfirmePasswordConroller,
                  myIcon: const Icon(Icons.lock),
                  myValidator: null,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                    myButtonLabel: "SignUp",
                    MyOnpressedFct: () {
                      if (myFormState.currentState!.validate()) {
                        print("Valide");
                        _register();
                        Navigator.pushNamed(context, 'Home_page');
                      } else {
                        print("Not Valide");
                      }
                    }),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'OR',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 8,
                ),
                MyButton(
                    myButtonLabel: "Sign in with Google",
                    MyOnpressedFct: () async {
                      await signInWithGoogle();
                      Navigator.pushNamed(context, 'Home_page');
                    }),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 14),
                    ),
                    MyTextButton(
                        myButtonlabel: "Login",
                        MyOnpressedFct: () {
                          Navigator.pushNamed(context, 'Login_Page');
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
