import 'package:kurly_shopping_cart_app/data/model/ingredients.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_1_page.dart';

import '../../configs/constants/enum.dart';
import '../../core/error_handling/exceptions.dart';
import 'keyword.dart';
import 'recipe.dart';
import 'user.dart';

class KurlyUserResponse {
  int totalResults = 0;
  List<KurlyUser> results;

  KurlyUserResponse({required this.totalResults, required this.results});

  factory KurlyUserResponse.fromJson(Map<String, dynamic> json) {
    try {
      List<KurlyUser> list = [];
      int totalDocuments = 0;

      if (json['userList'] != null) {
        list = json['userList']
            .map<KurlyUser>((json) => KurlyUser.fromJson(json))
            .toList();
        totalDocuments = list.length;
      }

      return KurlyUserResponse(
        totalResults: totalDocuments,
        results: list,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}

class CartResultResponse {
  List<List<Recipe>> recipeList = [[]];
  List<Ingredient> ingredientList = [];
  int totalMealPrice = 0;

  CartResultResponse(
      {required this.totalMealPrice,
      required this.recipeList,
      required this.ingredientList});

  factory CartResultResponse.fromJson(Map<String, dynamic> json) {
    try {
      List<List<Recipe>> totalDailyRecipeList = [];
      List<Ingredient> totalIngredientList = [];
      int mealPrice = 0;

      if (json['receiptList'] != null) {
        totalDailyRecipeList =
            (json['receiptList'] as List<dynamic>).map((dailyList) {
          List<Recipe> dailyRecipeList = (dailyList as List<dynamic>)
              .map((recipe) => Recipe.fromJson(recipe as Map<String, dynamic>))
              .toList();

          return dailyRecipeList;
        }).toList();
      }

      if (json['ingredientList'] != null) {
        totalIngredientList = (json['ingredientList'] as List<dynamic>)
            .map((ingredient) => Ingredient.fromJson(ingredient))
            .toList();
      }
      mealPrice = json['totalMealPrice'] as int;

      return CartResultResponse(
        totalMealPrice: mealPrice,
        recipeList: totalDailyRecipeList,
        ingredientList: totalIngredientList,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }

  Map<String, dynamic> toJson() {
    List<List<Map<String, dynamic>>> recipeListMap =
        recipeList.map((dailyList) {
      // dynamic list = dailyList;
      List<Map<String, dynamic>> dailyRecipeList =
          dailyList.map((recipe) => recipe.toJson()).toList();

      return dailyRecipeList;
    }).toList();

    List<Map<String, dynamic>> ingredientListMap =
        ingredientList.map((ingredient) => ingredient.toJson()).toList();
    return {
      'receiptList': recipeListMap,
      'ingredientList': ingredientListMap,
    };
  }
}

class KeywordResponse {
  Map<KeywordType, List<String>> keywordMap;

  KeywordResponse({required this.keywordMap});

  factory KeywordResponse.fromJson(Map<String, dynamic> json) {
    try {
      Map<KeywordType, List<String>> newKeywordMap = {
        KeywordType.taste: [],
        KeywordType.cusine: [],
        KeywordType.foodType: [],
      };

      if (json['userKeywords'] != null) {
        Map<String, dynamic> list =
            json['userKeywords'] as Map<String, dynamic>;

        List<String> tasteList =
            (list['taste'] as List<dynamic>).map((e) => e as String).toList();
        List<String> cusineList =
            (list['cusine'] as List<dynamic>).map((e) => e as String).toList();
        List<String> foodTypeList = (list['foodType'] as List<dynamic>)
            .map((e) => e as String)
            .toList();

        // List<Keyword> tasteKeywordList = tasteList
        //     .map((keywordText) => Keyword(
        //         text: keywordText, keywordType: KeywordType.taste, weight: 0))
        //     .toList();
        newKeywordMap.update(
            KeywordType.taste, (value) => tasteList as List<String>);

        // List<Keyword> cusineKeywordList = tasteList
        //     .map((keywordText) => Keyword(
        //         text: keywordText, keywordType: KeywordType.cusine, weight: 0))
        //     .toList();
        newKeywordMap.update(
            KeywordType.cusine, (value) => cusineList as List<String>);

        // List<Keyword> foodTypeKeywordList = tasteList
        //     .map((keywordText) => Keyword(
        //         text: keywordText,
        //         keywordType: KeywordType.foodType,
        //         weight: 0))
        //     .toList();
        newKeywordMap.update(
            KeywordType.foodType, (value) => foodTypeList as List<String>);
      }

      return KeywordResponse(
        keywordMap: newKeywordMap,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}

class CartPriceResponse {
  int avgCartPrice = 0;
  int userCartPrice = 0;

  CartPriceResponse({required this.avgCartPrice, required this.userCartPrice});

  factory CartPriceResponse.fromJson(Map<String, dynamic> json) {
    try {
      int avgPrice = 0;
      int myPrice = 0;

      if (json['totalPriceByShoppingLog'] != null) {
        avgPrice = json['totalPriceByShoppingLog'] as int;
      }
      if (json['totalPriceByPattern'] != null) {
        myPrice = json['totalPriceByPattern'] as int;
      }

      return CartPriceResponse(avgCartPrice: avgPrice, userCartPrice: myPrice);
    } catch (e) {
      throw DataParsingException();
    }
  }
}
