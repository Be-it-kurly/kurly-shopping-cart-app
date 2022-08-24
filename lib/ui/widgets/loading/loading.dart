import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> showLoading(Future<dynamic> Function() asyncFunction) async {
  return Get.showOverlay(
      opacityColor: Colors.white,
      asyncFunction: asyncFunction,
      loadingWidget: SizedBox(
        height: 100,
        child: SizedBox(
          height: KurlyHeight - 380,
          child: OverflowBox(
            minHeight: 150,
            maxHeight: 150,
            child: Lottie.asset('assets/jsons/loading.json'),
          ),
        ),
      ));
}
