import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurly_shopping_cart_app/controller/shopping_cart/shopping_cart_step1_controller.dart';
import 'package:kurly_shopping_cart_app/controller/shopping_cart/shopping_cart_step2_controller.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/appbar/appbar.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/button/wide_button.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/picker/number_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../widgets/bottom_sheet/bottom_sheet.dart';

class ShoppingCartStep2 extends StatelessWidget {
  ShoppingCartStep2({Key? key}) : super(key: key);
  ShoppingCartStep2Controller _controller =
      Get.put(ShoppingCartStep2Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KurlyAppBar(
        backgroundColor: KurlyColors.white,
        title: '',
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showResultBottomSheet(avgAmount: 140000, myAmount: 130000);
          },
          backgroundColor: KurlyColors.purple100,
          child: Image.asset(
            'assets/icons/arrow_right.png',
            width: 27,
          )),
      body: Column(
        children: [
          Container(
            width: KurlyWidth,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 50,
                  size: 3,
                  padding: 0,
                  selectedColor: KurlyColors.purple100,
                  unselectedColor: KurlyColors.grey100,
                  roundedEdges: Radius.circular(10),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '장바구니를\n얼마나 채워볼까요?',
                  style: TextStyle(
                      fontFamily: KurlyFontStyle.notoSansKR,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '지혜님,  ',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w400,
                                fontSize: 19),
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap: () async {
                                Get.defaultDialog(
                                    backgroundColor: Colors.white,
                                    title: '식사하는 인원수를\n선택해주세요',
                                    titlePadding:
                                        EdgeInsets.only(top: 25, bottom: 10),
                                    titleStyle: TextStyle(
                                        fontFamily: KurlyFontStyle.notoSansKR,
                                        fontWeight: FontWeight.w400,
                                        color: KurlyColors.black,
                                        fontSize: 18),
                                    content: SizedBox(
                                      height: 200,
                                      width: 100,
                                      child: Obx(
                                        () => NumberPicker(
                                          haptics: true,
                                          value: _controller
                                              .selectedPeopleNum.value,
                                          minValue: 0,
                                          maxValue: 10,
                                          onChanged: (value) {
                                            _controller.selectedPeopleNum
                                                .value = value;
                                          },
                                          textStyle: GoogleFonts.openSans(
                                              color: KurlyColors.grey150,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              height: 1.1),
                                          selectedTextStyle:
                                              GoogleFonts.openSans(
                                                  color: KurlyColors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 28,
                                                  height: 1.1),
                                        ),
                                      ),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.5,
                                            color: KurlyColors.grey150))),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text(
                                    (_controller.selectedPeopleNum.value != 0)
                                        ? _controller.selectedPeopleNum.value
                                            .toString()
                                        : '',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                        height: 1.1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '명의',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w400,
                                fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(
                            () => KurlyTextSelectionButton(
                              selectedValueList:
                                  _controller.selectedMeals.toList(),
                              text: '아침',
                              value: Meal.breakfast,
                              onTap: () {
                                if (_controller.selectedMeals
                                    .contains(Meal.breakfast)) {
                                  _controller.selectedMeals
                                      .remove(Meal.breakfast);
                                } else {
                                  _controller.selectedMeals.add(Meal.breakfast);
                                }
                              },
                            ),
                          ),
                          Obx(
                            () => KurlyTextSelectionButton(
                              selectedValueList:
                                  _controller.selectedMeals.toList(),
                              text: '점심',
                              value: Meal.lunch,
                              onTap: () {
                                if (_controller.selectedMeals
                                    .contains(Meal.lunch)) {
                                  _controller.selectedMeals.remove(Meal.lunch);
                                } else {
                                  _controller.selectedMeals.add(Meal.lunch);
                                }
                              },
                            ),
                          ),
                          Obx(
                            () => KurlyTextSelectionButton(
                              selectedValueList:
                                  _controller.selectedMeals.toList(),
                              text: '저녁',
                              value: Meal.dinner,
                              onTap: () {
                                if (_controller.selectedMeals
                                    .contains(Meal.dinner)) {
                                  _controller.selectedMeals.remove(Meal.dinner);
                                } else {
                                  _controller.selectedMeals.add(Meal.dinner);
                                }
                              },
                            ),
                          ),
                          Text(
                            '을 위한',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w400,
                                fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Get.defaultDialog(
                                backgroundColor: Colors.white,
                                title: '장을 볼 일수를\n선택해주세요',
                                titlePadding:
                                    EdgeInsets.only(top: 25, bottom: 10),
                                titleStyle: TextStyle(
                                    fontFamily: KurlyFontStyle.notoSansKR,
                                    fontWeight: FontWeight.w400,
                                    color: KurlyColors.black,
                                    fontSize: 18),
                                content: SizedBox(
                                  height: 200,
                                  width: 100,
                                  child: Obx(
                                    () => NumberPicker(
                                      haptics: true,
                                      value: _controller.selectedDateNum.value,
                                      minValue: 0,
                                      maxValue: 8,
                                      onChanged: (value) {
                                        _controller.selectedDateNum.value =
                                            value;
                                      },
                                      textStyle: GoogleFonts.openSans(
                                          color: KurlyColors.grey150,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          height: 1.1),
                                      selectedTextStyle: GoogleFonts.openSans(
                                          color: KurlyColors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28,
                                          height: 1.1),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              height: 35,
                              width: 33,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1.5,
                                          color: KurlyColors.grey150))),
                              child: Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Obx(
                                  () => Text(
                                    (_controller.selectedDateNum.value != 0)
                                        ? _controller.selectedDateNum.value
                                            .toString()
                                        : '',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                        height: 1.1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '일 치의 장바구니를 담아볼게요.',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w400,
                                fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KurlyTextSelectionButton extends StatelessWidget {
  KurlyTextSelectionButton({
    Key? key,
    required this.text,
    this.selectedTextColor = KurlyColors.black,
    this.unselectedTextColor = KurlyColors.grey150,
    required this.selectedValueList,
    this.onTap,
    required this.value,
  }) : super(key: key);

  String text;
  Color selectedTextColor;
  Color unselectedTextColor;
  List<dynamic> selectedValueList;
  dynamic value;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 45,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: KurlyFontStyle.notoSansKR,
              fontWeight: (selectedValueList.contains(value))
                  ? FontWeight.bold
                  : FontWeight.w500,
              color: (selectedValueList.contains(value))
                  ? selectedTextColor
                  : unselectedTextColor,
              fontSize: 20),
        ),
      ),
    );
  }
}
