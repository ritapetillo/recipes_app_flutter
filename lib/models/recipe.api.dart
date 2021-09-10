import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes_app_flutter/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> fetchRecipes() async {
    print('fetching');
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list",
        {"start": "0", "limit": "18", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "0618aa7c6fmshf007cd0aec30d32p15aad3jsn0a3df7e042e8",
      "useQueryString": "true"
    });
    Map data = json.decode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
