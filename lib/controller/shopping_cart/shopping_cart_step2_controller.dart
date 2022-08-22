import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';

import '../../ui/pages/shopping_cart/shopping_cart_1.dart';

enum Meal { breakfast, lunch, dinner }

class ShoppingCartStep2Controller extends GetxController {
  final RxList<KeywordNode> nodeList = <KeywordNode>[].obs;
  RxList<Meal> selectedMeals = RxList<Meal>();
  Rx<int> selectedPeopleNum = 0.obs;
  Rx<int> selectedDateNum = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
