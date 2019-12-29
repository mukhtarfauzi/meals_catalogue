import 'package:flutter_test/flutter_test.dart';
import 'package:meals_catalogue/model/meal.dart';
import 'package:meals_catalogue/model/meals.dart';
import 'package:meals_catalogue/service/api_service.dart';
import 'package:meals_catalogue/service/sqllite_service.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {}

class MockListMeal extends Mock implements Future<List<Meal>> {}

class MockMeals extends Mock implements Future<Meals> {}

class MockDBHelper extends Mock implements DBHelper {}

void main() async {
  final mockApiService = MockApiService();
  final apiService = ApiService();

  group('Api Service Test', () {
    ///Test Api Service saat memilih kategori Seafood akan mengambalikan data daftar Meal pada kategori Seafood
    ///
    test("test api service get Meal by category", () async {
      final listMeal = await apiService.getDataByCategory("Seafood");
      bool mealHasData = false;
      if(listMeal.length > 0){
        mealHasData = true;
      }
      expect(mealHasData, true);
    });

    test("test api service get Meal by id", () async {
      final listMeal = await apiService.getDetailById("52960");
      bool mealHasData = false;
      if(listMeal.meals.length > 0){
        mealHasData = true;
      }
      expect(mealHasData, true);
    });
    test("return a List Meal when function completes with mock data", () async {
      when(mockApiService.getDataByCategory("Seafood")).thenAnswer((_) {
        final listMeal = MockListMeal();
        return listMeal;
      });
      expect(mockApiService.getDataByCategory("Seafood"),
          isInstanceOf<MockListMeal>());
    });

    ///Test Api Service saat memilih id tertentu akan mengambalikan detail Meal
    test("return a Detail Meal when function completes", () async {
      when(mockApiService.getDetailById("52960")).thenAnswer((_) {
        final listMeal = MockMeals();
        return listMeal;
      });
      expect(mockApiService.getDetailById("52960"),
          isInstanceOf<MockMeals>());
    });
  });
}
