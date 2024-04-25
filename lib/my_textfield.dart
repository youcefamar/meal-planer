import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String myHintText;
  final Icon myIcon;
  final TextEditingController? myController;
  final bool? isObscure;
  final String? Function(String?)? myValidator;
  MyTextField(
      {required this.myHintText,
      this.isObscure,
      this.myController,
      required this.myIcon,
      this.myValidator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: myValidator,
      controller: myController,
      decoration: InputDecoration(
          hintText: myHintText,
          hintStyle: TextStyle(),
          border: OutlineInputBorder(),
          filled: false,
          fillColor: Colors.red,
          prefixIcon: myIcon),
    );
  }
}
