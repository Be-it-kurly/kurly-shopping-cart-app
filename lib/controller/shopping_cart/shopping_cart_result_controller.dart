import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:kurly_shopping_cart_app/data/model/ingredients.dart';
import 'package:kurly_shopping_cart_app/data/model/recipe.dart';
import 'package:kurly_shopping_cart_app/data/model/response.dart';
import 'package:kurly_shopping_cart_app/data/repository/shopping_cart_repository.dart';
import 'package:kurly_shopping_cart_app/routes/routes.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/loading/loading.dart';

import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../auth_controller.dart';

class ShoppingCartResultController extends GetxController {
  Rx<int> selectedDay = 1.obs;
  // List<String> dayList = ['1일차', '2일차', '3일차'];
  late CartResultResponse _cartResult;
  List<List<Recipe>> dailyRecipeList = [];
  RxList<Ingredient> ingredientList = <Ingredient>[].obs;
  RxList<Ingredient> selectedIngredientList = <Ingredient>[].obs;
  int totalMeals = 0;
  int totalDays = 0;
  ShoppingCartRepository _shoppingCartRepository = ShoppingCartRepository();
  int _myCustomPrice = 0;
  List<Meal> _mealTime = [];
  int _peopleAmount = 0;
  int _searchCount = 0;
  List<String> _keywordList = [];
  RxInt _initialCartPrice = 0.obs;
  RxInt selectedCartPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    AuthController.to.updatePageView(isInit: 0);
    totalMeals = Get.arguments['totalMeals'] as int;
    totalDays = Get.arguments['totalDays'] as int;
    _cartResult = Get.arguments['cartResult'] as CartResultResponse;
    _myCustomPrice = Get.arguments['myPrice'] as int;
    _peopleAmount = Get.arguments['peopleAmount'] as int;
    _mealTime = Get.arguments['mealTime'] as List<Meal>;
    _keywordList = Get.arguments['keywordList'] as List<String>;
    _initialCartPrice.value = _cartResult.totalMealPrice;
    assignCartResult(cartResult: _cartResult);
  }

  @override
  void onReady() {
    super.onReady();
    ever(selectedIngredientList, setSelectedCartPrice);
  }

  assignCartResult({required CartResultResponse cartResult}) {
    dailyRecipeList.assignAll(cartResult.recipeList);
    ingredientList.assignAll(cartResult.ingredientList);
    selectedIngredientList.assignAll(cartResult.ingredientList);
    setSelectedCartPrice(selectedIngredientList);

    update();
  }

  setSelectedCartPrice(List<Ingredient> selectedIngredientList) {
    int totalSelectedCartPrice = 0;
    selectedIngredientList
        .map((ingredient) {
          return ingredient.ingredientCount * int.parse(ingredient.price);
        })
        .toList()
        .forEach((ingredientPrice) {
          totalSelectedCartPrice += ingredientPrice;
        });

    selectedCartPrice.value = totalSelectedCartPrice;
  }

  String mealTimeEnglishToKorean({required String mealTimeEng}) {
    List<String> mealTimeEngList = mealTimeEng.split(',');

    List<String> mealTimeKorList = mealTimeEngList.map((e) {
      if (e == 'breakfast') {
        return '아침';
      } else if (e == 'lunch') {
        return '점심';
      } else if (e == 'dinner') {
        return '저녁';
      } else {
        return '';
      }
    }).toList();

    String mealTimeKor = mealTimeKorList.join(', ');
    return mealTimeKor;
  }

  refreshCartResult() async {
    Either<Failure, CartResultResponse> cartResultEither = await showLoading(
        () => _shoppingCartRepository.getCartResult(
            daysNum: totalDays,
            keywordList: _keywordList,
            mealTime: _mealTime,
            peopleAmount: _peopleAmount,
            price: _myCustomPrice));

    CartResultResponse? cartResult = cartResultEither.fold((failure) {
      FailureInterpreter()
          .mapFailureToSnackbar(failure, 'getShoppingCartResult');
      return null;
    }, (cartResult) {
      assignCartResult(cartResult: _cartResult);
      _searchCount++;
    });
  }

  updateSoldCart() async {
    CartResultResponse cartResult = CartResultResponse(
        recipeList: dailyRecipeList,
        ingredientList: ingredientList,
        totalMealPrice: _initialCartPrice.value);

    Either<Failure, bool> updateCartEither = await showLoading(() =>
        _shoppingCartRepository.updateSoldCart(
            cartResult: cartResult, searchCount: _searchCount));

    bool success = updateCartEither.fold((failure) {
      FailureInterpreter().mapFailureToSnackbar(failure, 'updateSoldCart');
      return false;
    }, (success) {
      return true;
    });

    if (success) {
      Get.offAllNamed(
        Routes.HOME,
      );
    }
    return;
  }
}
