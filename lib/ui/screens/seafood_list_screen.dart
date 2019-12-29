import 'package:flutter/material.dart';
import 'package:meals_catalogue/service/api_service.dart';
import 'package:meals_catalogue/model/meal.dart';
import 'package:meals_catalogue/ui/screens/detail_screen.dart';

class SeafoodListScreen extends StatefulWidget {
  @override
  _SeafoodListScreenState createState() => _SeafoodListScreenState();
}

class _SeafoodListScreenState extends State<SeafoodListScreen> {
  final _apiService  = ApiService();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget gridView(List<Meal> snapshot) {
    return GridView.count(
      crossAxisCount: 2,
      children: snapshot.map((mealsAlbum) {
        return Card(
          child: GridTile(
              footer: Container(
                  color: Colors.black12,
                  child: FlatButton(
                      onPressed: () {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                            backgroundColor: Colors.black12,
                            content: Text(mealsAlbum.strMeal,
                                style: TextStyle(
                                    fontFamily: "BalooBhai", fontSize: 18))));
                      },
                      child: Text(
                        mealsAlbum.strMeal,
                        style: TextStyle(
                            fontFamily: "BalooBhai",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white70),
                      ))),
              child: Hero(
                  tag: mealsAlbum.strMealThumb,
                  child: GestureDetector(
                      onTap: () => goToDetailsPage(mealsAlbum),
                      child: Image.network(mealsAlbum.strMealThumb)))),
        );
      }).toList(),
    );
  }

  void goToDetailsPage(Meal mealsAlbum) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => DetailScreen(
          curAlbum: mealsAlbum,
        ),
      ),
    );
  }

  Widget circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: FutureBuilder<List<Meal>>(
          future: _apiService.getDataByCategory('Seafood'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Eror ${snapshot.error}");
            } else if (snapshot.hasData) {
              // return Text('has data');
              return gridView(snapshot.data);
            } else {
              return circularProgress();
            }
          },
        ));
  }
}
