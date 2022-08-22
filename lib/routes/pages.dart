import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/routes/routes.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_1.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_2.dart';
import '../ui/pages/home/home_page.dart';

class KurlyPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.SHOPPING_CART_STEP1,
        page: () => ShoppingCartStep1(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.SHOPPING_CART_STEP2,
        page: () => ShoppingCartStep2(),
        transition: Transition.cupertino),
  ];
}
