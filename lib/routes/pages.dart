import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/routes/routes.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_1_page.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_2_page.dart';
import 'package:kurly_shopping_cart_app/ui/pages/shopping_cart/shopping_cart_result_page.dart';
import 'package:kurly_shopping_cart_app/ui/pages/splash_page.dart';
import 'package:kurly_shopping_cart_app/ui/pages/start/start_page.dart';
import '../ui/pages/home/home_page.dart';

class KurlyPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 800)),
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.START,
        page: () => StartPage(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.SHOPPING_CART_STEP1,
        page: () => ShoppingCartStep1Page(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.SHOPPING_CART_STEP2,
        page: () => ShoppingCartStep2Page(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.SHOPPING_CART_RESULT,
        page: () => ShoppingCartResultPage(),
        transition: Transition.cupertino),
  ];
}
