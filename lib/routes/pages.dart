import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/routes/routes.dart';

import '../ui/pages/home/home_page.dart';

class KurlyPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        transition: Transition.noTransition),
  ];
}
