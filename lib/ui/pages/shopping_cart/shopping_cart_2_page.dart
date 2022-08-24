import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurly_shopping_cart_app/controller/shopping_cart/shopping_cart_step2_controller.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/appbar/appbar.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../configs/constants/enum.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/shopping_cart/shopping_cart_price_controller.dart';
import '../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../widgets/button/floating_next_button.dart';
import '../../widgets/button/text_selection_button.dart';

class ShoppingCartStep2Page extends StatelessWidget {
  ShoppingCartStep2Page({Key? key}) : super(key: key);
  ShoppingCartStep2Controller _controller =
      Get.put(ShoppingCartStep2Controller());
  ShoppingCartPriceController _cartPriceController =
      Get.put(ShoppingCartPriceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KurlyAppBar(
        backgroundColor: KurlyColors.white,
        title: '',
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50, right: 10),
        child: Obx(
          () => FloatingNextButton(
              onPressed: () {
                _controller.getCartPrice();
              },
              active: _controller.validateButton()),
        ),
      ),
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
                Obx(() {
                  return FAProgressBar(
                    currentValue: _controller.currentStepValue.value,
                    backgroundColor: KurlyColors.grey120,
                    progressColor: KurlyColors.purple100,
                    size: 3,
                  );
                }),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '장바구니를\n얼마나 채워볼까요?',
                  style: TextStyle(
                      fontFamily: KurlyFontStyle.notoSansKR,
                      fontWeight: FontWeight.w600,
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
                            '${AuthController.to.currentUser.userName.substring(1, 3)}님,  ',
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
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
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 37,
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
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 37,
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
                                fontSize: 20),
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
