import 'dart:async';
import 'package:meals_catalogue/model/meal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  DBHelper.internal();

  String favoriteTable = 'favorite';

  factory DBHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "FavoriteDb");
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $favoriteTable(idMeal TEXT PRIMARY KEY, strMeal TEXT, strMealThumb TEXT)");
    print("DB Created");
  }

  Future<int> saveFavourite(Meal meal) async {
    var dbClient = await db;
    int res = await dbClient.insert(favoriteTable, meal.toJson());
    print("Data Inserted");
    return res;
  }

  Future<List<Meal>> getFavorite() async {
    var dbClient = await db;
    List<Map> list =
        await dbClient.rawQuery("SELECT * FROM $favoriteTable");
    List<Meal> mealList = new List();
    for (int i = 0; i < list.length; i++) {
      var note = Meal(
        idMeal: list[i]["idMeal"],
        strMealThumb: list[i]["strMealThumb"],
        strMeal: list[i]["strMeal"],
      );
      mealList.add(note);
    }
    return mealList;
  }


  Future<int> deleteFavorite(Meal meal) async {
    var dbClient = await db;
    int res =
        await dbClient.rawDelete("DELETE FROM $favoriteTable WHERE idMeal = ?", [meal.idMeal]);
    return res;
  }

}

DBHelper dbHelper = DBHelper();
