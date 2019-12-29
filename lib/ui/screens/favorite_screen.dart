import 'package:flutter/material.dart';
import 'package:meals_catalogue/service/sqllite_service.dart';
import 'package:meals_catalogue/model/meal.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Meal>>(
      future: dbHelper.getFavorite(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(snapshot.data[index].strMealThumb),
                  title: Text(snapshot.data[index].strMeal),
                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () async {
                    int status = await dbHelper.deleteFavorite(snapshot.data[index]);
                    if(status != null){
                      final snackBar = SnackBar(
                        content: Text(snapshot
                            .data[index].strMeal +
                            ' Berhasil terhapus dari favorite'),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                      setState(() {

                      });
                    }
                  }),
                );
              });
        } else if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasData) {
          return Center(
            child: Text('Tidak ada Favorite Meal'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
