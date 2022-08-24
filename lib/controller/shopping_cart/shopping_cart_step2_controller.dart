import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:kurly_shopping_cart_app/data/model/response.dart';
import 'package:kurly_shopping_cart_app/data/repository/shopping_cart_repository.dart';
import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../../ui/pages/shopping_cart/shopping_cart_1_page.dart';
import '../../ui/widgets/bottom_sheet/bottom_sheet.dart';
import '../auth_controller.dart';

class ShoppingCartStep2Controller extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ShoppingCartRepository _shoppingCartRepository =
      ShoppingCartRepository();
  final RxList<BubbleNode> nodeList = <BubbleNode>[].obs;
  RxList<Meal> selectedMeals = RxList<Meal>();
  Rx<int> selectedPeopleNum = 0.obs;
  Rx<int> selectedDateNum = 0.obs;
  Rx<double> currentStepValue = 50.0.obs;
  Map<String, int> selectedKeywordMap = {};

  late Animation<int> animationInt;
  late AnimationController animationController;

  @override
  onInit() {
    super.onInit();
    AuthController.to.updatePageView(isInit: 0);
    selectedKeywordMap = Get.arguments as Map<String, int>;
    _setAnimationController();
  }

  @override
  void onClose() {
    animationController.dispose(); //
    super.dispose();
  }

  getSelectdKeywordMapToList() {
    List<String> selectedKeywordList = selectedKeywordMap.keys.toList();

    return selectedKeywordList;
  }

  getCartPrice() async {
    Either<Failure, CartPriceResponse> cartPriceEither =
        await _shoppingCartRepository.getCartPrice(
            peopleAmount: selectedDateNum.value,
            mealTime: selectedMeals.toList(),
            daysNum: selectedDateNum.value);

    cartPriceEither.fold(
        (failure) =>
            FailureInterpreter().mapFailureToDialog(failure, 'getCartPrice'),
        (cartPrice) => showCartResultBottomSheet(
            avgPrice: cartPrice.avgCartPrice,
            myPrice: cartPrice.userCartPrice,
            totalMeal: (selectedMeals.length * selectedDateNum.value)));
  }

  bool validateButton() {
    if (selectedDateNum.value > 0 &&
        selectedPeopleNum.value > 0 &&
        selectedMeals.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  _setAnimationController() {
    animationController = AnimationController(
        upperBound: 0.5,
        duration: const Duration(milliseconds: 700),
        vsync: this);

    final CurvedAnimation curve = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);

    animationInt = Tween<int>(begin: 1, end: 0).animate(curve);

    animationInt.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
    animationController.animateTo(20);
  }
}
