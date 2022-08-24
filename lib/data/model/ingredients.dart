class Ingredient {
  String ingredientId;
  String ingredientName;
  int ingredientCount;
  String thumbnail;
  String price;
  String volumn;
  String unit;

  Ingredient(
      {required this.ingredientId,
      required this.ingredientName,
      required this.thumbnail,
      required this.ingredientCount,
      required this.price,
      required this.unit,
      required this.volumn});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredientId: json["ingredientId"] as String,
      ingredientName: json["ingredientName"] as String,
      thumbnail: json["thumbnail"] as String,
      ingredientCount: json["ingredientCount"] as int,
      price: json["price"] as String,
      unit: json["unit"] as String,
      volumn: json["volumn"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'ingredientId': ingredientId,
        'ingredientName': ingredientName,
        'ingredientCount': ingredientCount,
        'thumbnail': thumbnail,
        'price': price,
        'unit': unit,
        'volumn': volumn,
      };
}
