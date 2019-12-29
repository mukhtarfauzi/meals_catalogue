import 'package:flutter/material.dart';
import 'package:meals_catalogue/service/api_service.dart';
import 'package:meals_catalogue/model/meal.dart';
import 'package:meals_catalogue/ui/screens/detail_screen.dart';

class DesertListScreen extends StatefulWidget {
  DesertListScreen() : super();

  @override
  _Desert createState() => _Desert();
}

class _Desert extends State<DesertListScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _apiService  = ApiService();



  _gridview(AsyncSnapshot<List<Meal>> snapshot) {
    return GridView.count(
      crossAxisCount: 2,
      children: snapshot.data.map((mealsAlbum) {
        return Card(
            child: GridTile(
                footer: Container(
                    color: Colors.black12,
                    child: FlatButton(
                        onPressed: () {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
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
                        child: Image.network(mealsAlbum.strMealThumb)))));
      }).toList(),
    );
  }

  Widget circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  void goToDetailsPage(Meal mealsAlbum) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => DetailScreen(curAlbum: mealsAlbum),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Column(
          children: <Widget>[
            Flexible(
              child: FutureBuilder<List<Meal>>(
                future: _apiService.getDataByCategory("Dessert"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Eror ${snapshot.error}");
                  }
                  if (snapshot.hasData) {
                    return _gridview(snapshot);
                  }
                  return circularProgress();
                },
              ),
            )
          ],
        ));
  }
}
