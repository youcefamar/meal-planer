import 'package:flutter/material.dart';
import 'package:tp/meal.dart';
import 'package:tp/my_button.dart';
import 'package:tp/my_textfield.dart';

String? MyValidateMeal(String? value) {
  if (value!.isEmpty) {
    return "Can't be empty";
  }
  return null;
}

class AddNewMealPage extends StatefulWidget {
  @override
  State<AddNewMealPage> createState() => _AddNewMealPageState();
}

class _AddNewMealPageState extends State<AddNewMealPage> {
  final GlobalKey<FormState> myFormState = GlobalKey<FormState>();
  List<MyTextField> _myTextfieldlist = [];
  TextEditingController _mealnameConroller = TextEditingController();
  TextEditingController _imgPathConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'New Meal +',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: myFormState,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                    myController: _mealnameConroller,
                    myHintText: "Entre meals name",
                    isObscure: false,
                    myIcon: const Icon(Icons.restaurant_menu),
                    myValidator: MyValidateMeal),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                    myController: _imgPathConroller,
                    myHintText: "Entre Image Path",
                    isObscure: false,
                    myIcon: const Icon(Icons.image),
                    myValidator: MyValidateMeal),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'List of ingrediants',
                          style: TextStyle(),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (_myTextfieldlist.isNotEmpty)
                                  _myTextfieldlist.removeLast();
                              });
                            },
                            icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _myTextfieldlist.add(MyTextField(
                                  myHintText: 'Entre an Ingredient',
                                  myIcon: const Icon(Icons.food_bank),
                                  myValidator: MyValidateMeal,
                                ));
                              });
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _myTextfieldlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _myTextfieldlist[index],
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              MyButton(
                  myButtonLabel: 'Add',
                  MyOnpressedFct: () {
                    if (myFormState.currentState!.validate()) {
                      if (_myTextfieldlist.isNotEmpty) {
                        print("Valid");
                        // Extract ingredient names from MyTextField widgets and filter out null values
                        List<String> ingredientNames = _myTextfieldlist
                            .map((textField) => textField.myController?.text)
                            .where((text) => text != null)
                            .map((text) => text!)
                            .toList();

                        // Create a new Meal object using the extracted data
                        Meal _meal = Meal(
                          name: _mealnameConroller.text,
                          imgPath: _imgPathConroller.text,
                          listOfIngredient: ingredientNames,
                        );

                        Navigator.pop(context, _meal);
                      } else {
                        print("Please enter at least one ingredient.");
                      }
                    } else {
                      print("Not Valid");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
