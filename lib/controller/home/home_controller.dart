import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/data/model/user.dart';

import '../../configs/constants/enum.dart';
import '../auth_controller.dart';

class HomeController extends GetxController {
  late KurlyUser _user;
  Rx<PeopleAmount> selectedPeopleAmount = PeopleAmount.one.obs;
  List<PeopleAmount> peopleAmountList = [
    PeopleAmount.one,
    PeopleAmount.two,
    PeopleAmount.three,
    PeopleAmount.four
  ];

  KurlyUser get user => _user;

  @override
  void onInit() {
    super.onInit();
    AuthController.to.updatePageView(isInit: 0);
    _user = AuthController.to.currentUser;
  }
}
