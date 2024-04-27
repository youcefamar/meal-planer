import 'package:flutter/material.dart';
import 'package:tp/meal.dart';

class ingListPage extends StatefulWidget {
  final List listOfIng;
  const ingListPage({super.key, required this.listOfIng});

  @override
  State<ingListPage> createState() => _ingListPageState();
}

class _ingListPageState extends State<ingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
    );
  }
}
