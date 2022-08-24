import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';

showSnackbar({required String text}) => Get.showSnackbar(GetSnackBar(
      backgroundColor: Color.fromARGB(203, 41, 41, 41),
      barBlur: 10,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      padding: const EdgeInsets.symmetric(vertical: 15),
      borderRadius: 10,
      titleText: Text(
        text,
        style: TextStyle(
            fontFamily: KurlyFontStyle.notoSansKR,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: KurlyColors.white),
        textAlign: TextAlign.center,
      ),
      messageText: const SizedBox.shrink(),
      animationDuration: const Duration(milliseconds: 700),
      duration: const Duration(milliseconds: 1000),
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.none,
    ));
