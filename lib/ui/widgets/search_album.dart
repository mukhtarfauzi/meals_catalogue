import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/meal.dart';
import 'package:meals_catalogue/ui/screens/detail_screen.dart';

class SearchAlbum extends SearchDelegate<String> {
  final List<Meal> dataAlbum;

  SearchAlbum({this.dataAlbum});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    
    return Column(
      children: <Widget>[
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    void goToDetailPage(BuildContext context, Meal dataAlbum) {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => DetailScreen(curAlbum: dataAlbum),
        ),
      );
    }

    final result =
        dataAlbum.where((meal) => meal.strMeal.toLowerCase().contains(query));
    return ListView(
      children: result
          .map<ListTile>((meal) => ListTile(
                title: Text(meal.strMeal),
                leading: Icon(Icons.favorite),
                onTap: () => goToDetailPage(context, meal),
              ))
          .toList(),
    );
  }
}
