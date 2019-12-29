import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/meal.dart';

class CardAlbum extends StatelessWidget {
  const CardAlbum(this.mealsAlbum, this.context);

  @required
  final Meal mealsAlbum;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: mealsAlbum.strMealThamb,
                child: Image.network(
                  mealsAlbum.strMealThamb,
                ),
              ),
            ),
            Text(
              mealsAlbum.strMeal,
              style: TextStyle(fontFamily: "BalooBhai"),
            ),
          ],
        ),
      ),
    );
  }
}
