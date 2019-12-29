import 'package:http/http.dart' as http;
import 'package:meals_catalogue/model/meal.dart';
import 'dart:convert';
import 'package:meals_catalogue/model/meals.dart';


class ApiService {
  Future<List<Meal>> getDataByCategory(String category) async {
    try {
      final response = await http
          .get("https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");
      print(response.body);
      if (response.statusCode == 200) {
        Map parse = jsonDecode(response.body);
        Meals album = Meals.fromJson(parse);
        return album.meals;
      } else {
        throw Exception("Eror");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<Meals> getDetailById(String id) async {
    try {
      final response = await http
          .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
      print(response.body);
      if (response.statusCode == 200) {
        Map parse = jsonDecode(response.body);
        Meals album = Meals.fromJson(parse);
        return album;
      } else {
        throw Exception("Eror");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
