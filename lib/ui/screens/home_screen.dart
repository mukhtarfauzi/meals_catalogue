import 'package:flutter/material.dart';
import 'package:meals_catalogue/config.dart';
import 'package:meals_catalogue/service/api_service.dart';
import 'package:meals_catalogue/model/meal.dart';
import 'package:meals_catalogue/ui/screens/desert_list_screen.dart';
import 'package:meals_catalogue/ui/screens/favorite_screen.dart';
import 'package:meals_catalogue/ui/screens/seafood_list_screen.dart';
import 'package:meals_catalogue/ui/widgets/search_album.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _apiService  = ApiService();
  TabController controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  Future<List<Meal>> _fetchAllMeal() async {
    List<Meal> allMeal = [];
    final seafood = await _apiService.getDataByCategory("Seafood");
    final desert = await _apiService.getDataByCategory("Dessert");
    allMeal.addAll(seafood);
    allMeal.addAll(desert);
    return allMeal;
  }

  @override
  void initState() {
    _fetchAllMeal();
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Config.configColor ,
          automaticallyImplyLeading: false,
          leading: Config.helloIcon,
          title: Text(Config.helloMessage),
          actions: <Widget>[
            FutureBuilder<List<Meal>>(
              future: _fetchAllMeal(),
              builder: (context, allMeal) {
                if (allMeal.connectionState == ConnectionState.done) {
                  return IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () => showSearch(
                          context: context,
                          delegate: SearchAlbum(dataAlbum: allMeal.data)));
                } else {
                  return CircularProgressIndicator(
                  strokeWidth: 1,
                  );
                }
              },
            )
          ]),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          DesertListScreen(),
          SeafoodListScreen(),
          FavoriteScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Config.configColor,
        child: TabBar(controller: controller, tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.fastfood,
              color: Color(0xFF3E2723),
            ),
            text: "Dessert",
          ),
          Tab(
            icon: Icon(Icons.fastfood, color: Color(0xFF3E2723)),
            text: "Seafood",
          ),
          Tab(
            icon: Icon(Icons.favorite, color: Color(0xFF3E2723)),
            text: "Favorite",
          )
        ]),
      ),
    );
  }
}
