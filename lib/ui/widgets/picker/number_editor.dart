import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/button/wide_button.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/snackbar/snackbar.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../theme/colors.dart';
import '../../theme/text_style.dart';

showNumberEditor({required int initialValue}) async {
  RxInt _costValue = initialValue.obs;
  return Get.dialog(Dialog(
    insetPadding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    child: Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: KurlyColors.white,
      ),
      height: 250,
      width: KurlyWidth - 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.bottomCenter,
              height: 50,
              child: Text('적정 금액의 30% 까지만 수정 가능해요')),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: BoxDecoration(
                      color: KurlyColors.grey100,
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      int minusNum = 0;
                      if (_costValue.value > 50000) {
                        minusNum = 5000;
                      } else {
                        minusNum = 2000;
                      }
                      int number = _costValue.value;
                      number -= minusNum;

                      if (number > (initialValue - (initialValue * 0.3))) {
                        _costValue.value -= minusNum;
                      } else {
                        showSnackbar(text: '너무 적은 금액은 설정할 수 없어요');
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 30,
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontFamily: KurlyFontStyle.notoSansKR,
                            fontWeight: FontWeight.w500,
                            color: KurlyColors.grey200,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => AnimatedFlipCounter(
                    value: _costValue.value,
                    duration: Duration(milliseconds: 100),
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
                Ink(
                  decoration: BoxDecoration(
                      color: KurlyColors.grey100,
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      int plusNum = 0;
                      if (_costValue.value > 50000) {
                        plusNum = 5000;
                      } else {
                        plusNum = 2000;
                      }
                      int num = _costValue.value;
                      num += plusNum;
                      if (num < (initialValue + initialValue * 0.3)) {
                        _costValue.value += plusNum;
                      } else {
                        showSnackbar(text: '너무 많은 금액은 설정할 수 없어요');
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 30,
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontFamily: KurlyFontStyle.notoSansKR,
                            fontWeight: FontWeight.w500,
                            color: KurlyColors.grey200,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KurlyWideButtonWidget(
                  buttonText: '취소',
                  onTap: () {
                    Get.back(result: null);
                  },
                  activeButtonColor: KurlyColors.grey120,
                  buttonWidth: (KurlyWidth - 50 - 40) / 2,
                  active: true,
                  activeTextColor: KurlyColors.grey200),
              SizedBox(
                width: 10,
              ),
              KurlyWideButtonWidget(
                  buttonText: '수정',
                  onTap: () {
                    Get.back(result: _costValue.value);
                  },
                  activeButtonColor: KurlyColors.purple100,
                  buttonWidth: (KurlyWidth - 50 - 40) / 2,
                  active: true,
                  activeTextColor: KurlyColors.white),
            ],
          ),
        ],
      ),
    ),
  ));
}
