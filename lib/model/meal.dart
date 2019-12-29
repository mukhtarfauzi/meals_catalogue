class Meal {
  final String strMeal;
  final String strMealThamb;
  final String idMeal;
  String strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String strIngredient6;
  String strIngredient7;
  String strIngredient8;
  String strIngredient9;
  String strIngredient10;
  String strIngredient11;
  String strIngredient12;
  String strIngredient13;
  String strIngredient14;
  String strIngredient15;
  String strIngredient16;
  String strIngredient17;
  String strIngredient18;
  String strIngredient19;
  String strIngredient20;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  String strMeasure4;
  String strMeasure5;
  String strMeasure6;
  String strMeasure7;
  String strMeasure8;
  String strMeasure9;
  String strMeasure10;
  String strMeasure11;
  String strMeasure12;
  String strMeasure13;
  String strMeasure14;
  String strMeasure15;
  String strMeasure16;
  String strMeasure17;
  String strMeasure18;
  String strMeasure19;
  String strMeasure20;
  String strSource;
  String dateModified;

  Meal(
      {this.strMeal,
      this.strMealThamb,
      this.idMeal,
      this.strDrinkAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.strYoutube,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strIngredient16,
      this.strIngredient17,
      this.strIngredient18,
      this.strIngredient19,
      this.strIngredient20,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strMeasure16,
      this.strMeasure17,
      this.strMeasure18,
      this.strMeasure19,
      this.strMeasure20,
      this.strSource,
      this.dateModified});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
      idMeal: json['idMeal'] as String,
      strDrinkAlternate: json['strDrinkAlternate'] as String,
      strCategory: json['strCategory'] as String,
      strArea: json['strArea'] as String,
      strInstructions: json['strInstructions']as String,
      strTags: json['strTags']as String,
      strYoutube: json['strYoutube']as String,
      strIngredient1: json['strIngredient1']as String,
      strIngredient2: json['strIngredient2']as String,
      strIngredient3: json['strIngredient3']as String,
      strIngredient4: json['strIngredient4']as String,
      strIngredient5: json['strIngredient5']as String,
      strIngredient6: json['strIngredient6']as String,
      strIngredient7: json['strIngredient7']as String,
      strIngredient8: json['strIngredient8']as String,
      strIngredient9: json['strIngredient9']as String,
      strIngredient10: json['strIngredient10']as String,
      strIngredient11: json['strIngredient11']as String,
      strIngredient12: json['strIngredient12']as String,
      strIngredient13: json['strIngredient13']as String,
      strIngredient14: json['strIngredient14']as String,
      strIngredient15: json['strIngredient15']as String,
      strIngredient16: json['strIngredient16']as String,
      strIngredient17: json['strIngredient17']as String,
      strIngredient18: json['strIngredient18']as String,
      strIngredient19: json['strIngredient19']as String,
      strIngredient20: json['strIngredient20']as String,
      strMeasure1: json['strMeasure1']as String,
      strMeasure2: json['strMeasure2']as String,
      strMeasure3: json['strMeasure3']as String,
      strMeasure4: json['strMeasure4']as String,
      strMeasure5: json['strMeasure5']as String,
      strMeasure6: json['strMeasure6']as String,
      strMeasure7: json['strMeasure7']as String,
      strMeasure8: json['strMeasure8']as String,
      strMeasure9: json['strMeasure9']as String,
      strMeasure10: json['strMeasure10']as String,
      strMeasure11: json['strMeasure11']as String,
      strMeasure12: json['strMeasure12']as String,
      strMeasure13: json['strMeasure13']as String,
      strMeasure14: json['strMeasure14']as String,
      strMeasure15: json['strMeasure15']as String,
      strMeasure16: json['strMeasure16']as String,
      strMeasure17: json['strMeasure17']as String,
      strMeasure18: json['strMeasure18']as String,
      strMeasure19: json['strMeasure19']as String,
      strMeasure20: json['strMeasure20']as String,
      strSource: json['strSource']as String,
      dateModified: json['dateModified']as String,
    );
  }

  Map<String, dynamic> toJson(){
    var json = Map<String, dynamic>();
    json['strMeal'] = strMeal;
    json['strMealThumb'] = strMealThumb;
    json['idMeal'] = idMeal;

    return json;
  }
}
