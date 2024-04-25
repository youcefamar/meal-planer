import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String myButtonlabel;
  final Function() MyOnpressedFct;
  MyTextButton({required this.myButtonlabel, required this.MyOnpressedFct});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: MyOnpressedFct,
        child: Text(
          myButtonlabel,
          style: TextStyle(color: Colors.blue),
        ));
  }
}

class MyButton extends StatelessWidget {
  final String myButtonLabel;
  final Function() MyOnpressedFct;
  MyButton({required this.myButtonLabel, required this.MyOnpressedFct});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        onPressed: MyOnpressedFct,
        child: Text(myButtonLabel),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(2),
          side: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
