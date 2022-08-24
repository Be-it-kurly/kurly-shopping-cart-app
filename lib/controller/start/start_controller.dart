import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/routes/routes.dart';
import '../../data/model/user.dart';
import '../auth_controller.dart';

class StartController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Animation<double> animationColor;
  late AnimationController animationController;
  final List<KurlyUser> _userList = [];
  List<KurlyUser> get userList => _userList;

  @override
  onInit() {
    super.onInit();

    _userList.assignAll(AuthController.to.kurlyUserList);
    _setTextAnimation();
  }

  setUserAndNextPage({required int userIndex}) async {
    await AuthController.to.setCurrentUser(selectedUser: _userList[userIndex]);
    AuthController.to.updatePageView(isInit: 1);
    Get.toNamed(Routes.HOME, arguments: userList[userIndex]);
  }

  _setTextAnimation() {
    animationController = AnimationController(
        upperBound: 0.5,
        duration: const Duration(milliseconds: 700),
        vsync: this);

    final CurvedAnimation curve = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);

    animationColor = Tween<double>(begin: 1, end: 0).animate(curve);

    animationColor.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
  }
}
