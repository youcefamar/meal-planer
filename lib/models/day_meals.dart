import 'package:tp/meal.dart';
import 'package:hive/hive.dart';
part 'day_meals.g.dart';

@HiveType(typeId: 2)
class DayMeals extends HiveObject {
  @HiveField(0)
  String? day;
  @HiveField(1)
  List<Meal>? listOfMeals;
  DayMeals({this.day, this.listOfMeals});
}
