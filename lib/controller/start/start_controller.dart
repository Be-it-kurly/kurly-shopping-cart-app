import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/routes/routes.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/snackbar/snackbar.dart';
import '../../data/model/user.dart';
import '../auth_controller.dart';

class StartController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Animation<double> animationColor;
  late AnimationController animationController;
  final List<KurlyUser> _userList = [];
  List<KurlyUser> get userList => _userList;
  KurlyUser? _selectedUser;

  @override
  onInit() {
    super.onInit();

    _userList.assignAll(AuthController.to.kurlyUserList);
    _setTextAnimation();
  }

  @override
  onClose() {
    animationController.dispose();
    super.onClose();
  }

  setUserAndNextPage({required int userIndex}) async {
    _selectedUser = await AuthController.to
        .onSelectedUserChanged(selectedUser: _userList[userIndex]);

    if (_selectedUser != null) {
      await AuthController.to.updatePageView(isInit: 1);
      Get.toNamed(Routes.HOME, arguments: _selectedUser);
    } else {
      showSnackbar(text: '유저를 인증할 수 없습니다');
    }
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
