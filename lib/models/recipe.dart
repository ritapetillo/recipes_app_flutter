class Recipe {
  final String name;
  final String image;
  final double raiting;
  final String totalTime;

  Recipe(
      {required this.name,
      required this.image,
      required this.raiting,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      raiting: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }
  static List<Recipe> recipesFromSnapshot(List jsonList) {
    return jsonList.map((item) => Recipe.fromJson(item)).toList();
  }

  @override
  String toString() {
    return 'Recipe{name: $name, image: $image, raiting: $raiting, totalTime: $totalTime}';
  }
}
