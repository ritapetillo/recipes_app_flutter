import 'package:flutter/material.dart';
import 'package:recipes_app_flutter/models/recipe.api.dart';
import 'package:recipes_app_flutter/views/widgets/recipe_card.dart';
import 'package:recipes_app_flutter/models/recipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

  Future<void> _getRecipes() async {
    List<Recipe> _recipes = await RecipeApi.fetchRecipes();
    setState(() {
      _isLoading = false;
      recipes = _recipes;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe'),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: recipes[index].name,
                      thumbnailUrl: recipes[index].image,
                      ratings: recipes[index].raiting.toString(),
                      cookTime: recipes[index].totalTime);
                }));
  }
}
