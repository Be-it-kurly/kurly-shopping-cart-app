import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kurly_shopping_cart_app/controller/shopping_cart/shopping_cart_step2_controller.dart';
import 'package:kurly_shopping_cart_app/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:kurly_shopping_cart_app/data/model/response.dart';
import 'package:kurly_shopping_cart_app/data/repository/shopping_cart_repository.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_2_page.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/loading/loading.dart';

import '../../core/error_handling/failures.dart';
import '../../routes/routes.dart';
import '../auth_controller.dart';

class ShoppingCartPriceController extends GetxController {
  // RxInt myCartPrice = 0.obs;
  // RxInt avgCartPrice = 0.obs;
  // RxBool edited = false.obs;
  // RxString pricePerMeal = ''.obs;
  // int totalMeal = 0;
  ShoppingCartRepository _shoppingCartRepository = ShoppingCartRepository();
  ShoppingCartStep2Controller _cartStep2Controller = Get.find();
  Map<String, int> selectedKeywordMap = {};

  @override
  void onInit() {
    super.onInit();
    AuthController.to.updatePageView(isInit: 0);
  }

  setShoppingCart({required int myCartPrice}) async {
    CartResultResponse? cartResultResponse = await showLoading(
        () => getShoppingCartResult(myCartPrice: myCartPrice));
    if (cartResultResponse != null) {
      Get.toNamed(Routes.SHOPPING_CART_RESULT, arguments: {
        "totalMeals": _cartStep2Controller.selectedDateNum.value *
            _cartStep2Controller.selectedMeals.length,
        "cartResult": cartResultResponse,
        "totalDays": _cartStep2Controller.selectedDateNum.value,
        "myPrice": myCartPrice,
        "peopleAmount": _cartStep2Controller.selectedPeopleNum.value,
        "mealTime": _cartStep2Controller.selectedMeals.toList(),
        "keywordList": _cartStep2Controller.getSelectdKeywordMapToList(),
      });
    }
  }

  getShoppingCartResult({required int myCartPrice}) async {
    Either<Failure, CartResultResponse> cartResultEither =
        await _shoppingCartRepository.getCartResult(
            daysNum: _cartStep2Controller.selectedDateNum.value,
            keywordList: _cartStep2Controller.getSelectdKeywordMapToList(),
            mealTime: _cartStep2Controller.selectedMeals.toList(),
            peopleAmount: _cartStep2Controller.selectedPeopleNum.value,
            price: myCartPrice);

    CartResultResponse? cartResult = cartResultEither.fold((failure) {
      FailureInterpreter()
          .mapFailureToSnackbar(failure, 'getShoppingCartResult');
      return null;
    }, (cartResult) => cartResult);

    return cartResult;
  }

  getSelectedKeywordAsString() {
    List<String> selectedKeywordList = selectedKeywordMap.keys.toList();
    String selectedKeywords = selectedKeywordList.join(',');
    print(selectedKeywords);
    return selectedKeywords;
  }
}
