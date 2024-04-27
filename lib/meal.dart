import 'package:hive/hive.dart';
part 'meal.g.dart';

@HiveType(typeId: 1)
class Meal extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? imgPath;
  @HiveField(2)
  String? identifiant;
  @HiveField(3)
  List<String>? listOfIngredient;
  Meal({this.name, this.imgPath, this.identifiant, this.listOfIngredient});
}
