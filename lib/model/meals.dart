import 'package:meals_catalogue/model/meal.dart';

class Meals {
  List<Meal> meals;

  Meals({
    this.meals
  });
  
  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      meals: (json['meals'] as List)?.map((e) => e== null?null: Meal.fromJson(e as Map<String, dynamic>))?.toList()
    );
  }
}
