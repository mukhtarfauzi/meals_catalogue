import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/service/api_service.dart';
import 'package:meals_catalogue/service/sqllite_service.dart';
import 'package:meals_catalogue/model/meal.dart';
import 'package:meals_catalogue/model/meals.dart';

import '../../config.dart';

class DetailScreen extends StatefulWidget {
  final Meal curAlbum;
  DetailScreen({
    @required this.curAlbum,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _apiService  = ApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Config.configColor,
          title: Text('Detail Screan'),
        ),
        body: FutureBuilder<Meals>(
            future: _apiService.getDetailById(widget.curAlbum.idMeal),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    Card(
                      child: Hero(
                        tag: widget.curAlbum.strMealThumb,
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              snapshot.data.meals[0].strMealThumb,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 20,
                              child: MaterialButton(
                                onPressed: () async{
                                  int status = await dbHelper
                                      .saveFavourite(snapshot.data.meals[0]);
                                  if(status != null){
                                    final snackBar = SnackBar(
                                    content: Text(snapshot
                                        .data.meals[0].strMeal +
                                        ' Berhasil tersimpan sebagai favorite'),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);

                                  }
                                },
                                color: Colors.red[400],
                                child: Text(
                                  "Favorite",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        snapshot.data.meals[0].strMeal ?? 'KOSOMG',
                        style: TextStyle(fontFamily: "BalooBhai"),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(snapshot.data.meals[0].strInstructions,
                              style: TextStyle(fontFamily: "BalooBhai"))),
                    ),
                  ],
                );
              } else {
                return Center();
              }
            }));
  }
}
