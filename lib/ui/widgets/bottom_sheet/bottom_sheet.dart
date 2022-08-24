import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kurly_shopping_cart_app/controller/shopping_cart/shopping_cart_price_controller.dart';
import 'package:kurly_shopping_cart_app/data/repository/shopping_cart_repository.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/button/wide_button.dart';

import '../../../routes/routes.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';
import '../picker/number_editor.dart';

showCartResultBottomSheet({
  required int avgPrice,
  required int myPrice,
  required int totalMeal,
}) async {
  ShoppingCartPriceController _controller = Get.find();

  String calculateAmountPerMeal(
      {required int totalPrice, required int totalMeal}) {
    var decimalFormat = NumberFormat('###,###,###,###');

    int price = (totalPrice / totalMeal).toInt();
    return decimalFormat.format(price);
  }

  RxInt _myCartPrice = 0.obs;
  RxInt _avgCartPrice = 0.obs;
  RxBool _edited = false.obs;
  RxString _pricePerMeal =
      calculateAmountPerMeal(totalPrice: myPrice, totalMeal: totalMeal).obs;
  int _totalMeal = totalMeal;

  Future.delayed(const Duration(milliseconds: 200), () {
    // ignore: avoid_print
    _myCartPrice.value = myPrice;
    _avgCartPrice.value = avgPrice;
  });

  return Get.bottomSheet(
    Container(
      height: 420,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: KurlyColors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(54, 0, 0, 0),
                blurRadius: 10,
                spreadRadius: -2),
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          Container(
            width: KurlyWidth,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '유사한 구매자들의 평균 구매 금액',
                    style: TextStyle(
                      fontFamily: KurlyFontStyle.notoSansKR,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Obx(
                          () => AnimatedFlipCounter(
                            value: _avgCartPrice.value,
                            duration: Duration(milliseconds: 700),
                            curve: Curves.fastLinearToSlowEaseIn,
                            thousandSeparator: ',',
                            wholeDigits: 4,
                            textStyle: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 35,
                                color: KurlyColors.purple100,
                                height: 1),
                          ),
                        ),
                      ),
                      Text(
                        '원',
                        style: TextStyle(
                            fontFamily: KurlyFontStyle.notoSansKR,
                            fontWeight: FontWeight.w700,
                            color: KurlyColors.purple100,
                            fontSize: 33,
                            height: 0.8),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        '내 장바구니 적정가',
                        style: TextStyle(
                          fontFamily: KurlyFontStyle.notoSansKR,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Tooltip(
                        preferBelow: false,
                        verticalOffset: 12,
                        margin: EdgeInsets.only(left: 145),
                        padding: EdgeInsets.all(13),
                        triggerMode: TooltipTriggerMode.tap,
                        waitDuration: Duration(milliseconds: 400),
                        showDuration: Duration(milliseconds: 1200),
                        message:
                            '내 장바구니 적정가는 내 구매패턴과\n타 회원들의 장바구니 적정가를\n고려하여 계산됩니다.',
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.info_rounded,
                            size: 18,
                            color: KurlyColors.grey150,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          int? editedValue = await showNumberEditor(
                              initialValue: _myCartPrice.value.toInt()) as int?;
                          if (editedValue != null) {
                            _myCartPrice.value = editedValue;
                            _pricePerMeal.value = calculateAmountPerMeal(
                                totalPrice: _myCartPrice.value,
                                totalMeal: _totalMeal);
                            _edited.value = true;
                          }
                        },
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(right: 2),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: KurlyColors.grey120))),
                          child: Obx(
                            () => AnimatedFlipCounter(
                              value: _myCartPrice.value,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              thousandSeparator: ',',
                              wholeDigits: 4,
                              textStyle: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                  color: (_edited.value)
                                      ? KurlyColors.purple100
                                      : KurlyColors.grey150,
                                  height: 1),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '원',
                        style: TextStyle(
                            fontFamily: KurlyFontStyle.notoSansKR,
                            fontWeight: FontWeight.w700,
                            color: KurlyColors.purple100,
                            fontSize: 33,
                            height: 0.8),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '총 끼니  ',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w400,
                                color: KurlyColors.black,
                                fontSize: 15),
                          ),
                          Text(
                            '$_totalMeal',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: KurlyColors.black,
                                height: 1.1),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '한 끼당  ',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w400,
                                color: KurlyColors.black,
                                fontSize: 15),
                          ),
                          Obx(
                            () => Text(
                              '$_pricePerMeal',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: KurlyColors.black,
                                  height: 1.1),
                            ),
                          ),
                          Text(
                            '원',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w600,
                                color: KurlyColors.black,
                                fontSize: 22,
                                height: 1.3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Obx(
            () => KurlyWideButtonWidget(
                buttonText: '장바구니 맡기기',
                onTap: () {
                  // Get.toNamed(Routes.SHOPPING_CART_RESULT);
                  _controller.setShoppingCart(myCartPrice: _myCartPrice.value);
                },
                activeButtonColor: KurlyColors.purple100,
                inactiveButtonColor: KurlyColors.grey100,
                inactiveTextColor: KurlyColors.grey150,
                buttonWidth: KurlyWidth - 40,
                active: (_edited.value) ? true : false,
                activeTextColor: KurlyColors.white),
          )
        ],
      ),
    ),
    enterBottomSheetDuration: const Duration(milliseconds: 300),
    exitBottomSheetDuration: const Duration(milliseconds: 300),
    backgroundColor: Colors.white,
    elevation: 100,
    barrierColor: Colors.black38,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
  );
}
