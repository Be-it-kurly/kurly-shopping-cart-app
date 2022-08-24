import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../configs/constants/enum.dart';
import '../../ui/pages/shopping_cart/shopping_cart_1_page.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  @JsonSerializable(explicitToJson: true)
  factory Recipe(
      {required int totalPrice,
      required String recipeName,
      required String mealTime,
      required String receiptId,
      required String difficulty,
      required String thumbnail,
      required String step,
      required int time,
      required int headcount}) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
