import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurly_shopping_cart_app/controller/home/home_controller.dart';
import 'package:kurly_shopping_cart_app/controller/shopping_cart/shopping_cart_result_controller.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/appbar/appbar.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/button/wide_button.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/snackbar/snackbar.dart';

import '../../../configs/helpers/formatter.dart';
import '../../../routes/routes.dart';
import '../../widgets/button/radio_button.dart';
import '../../widgets/item_widget/item_widget.dart';

class ShoppingCartResultPage extends StatelessWidget {
  ShoppingCartResultPage({Key? key}) : super(key: key);
  ShoppingCartResultController _controller =
      Get.put(ShoppingCartResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: KurlyWideButtonWidget(
            buttonText: '장바구니 구매하기',
            onTap: () {
              _controller.updateSoldCart();
            },
            activeButtonColor: KurlyColors.purple100,
            buttonWidth: KurlyWidth - 40,
            active: true,
            activeTextColor: KurlyColors.white),
        backgroundColor: KurlyColors.grey10,
        appBar: KurlyAppBar(
          backgroundColor: KurlyColors.purple100,
          title: '',
          leading: Container(
              margin: EdgeInsets.only(left: 5, bottom: 1),
              child: Image.asset('assets/images/kurly.png')),
          leadingScale: 2.5,
          leadingPadding:
              EdgeInsets.only(left: 10, bottom: 12, top: 8, right: 15),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 28,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: '총 ',
                                    style: TextStyle(
                                        fontFamily: KurlyFontStyle.notoSansKR,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22),
                                  ),
                                  TextSpan(
                                    text: '${_controller.totalMeals}',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22),
                                  ),
                                  TextSpan(
                                    text: '끼',
                                    style: TextStyle(
                                        fontFamily: KurlyFontStyle.notoSansKR,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22),
                                  ),
                                ])),
                                Row(children: [
                                  Text(
                                    '장바구니 금액 ',
                                    style: TextStyle(
                                        fontFamily: KurlyFontStyle.notoSansKR,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22),
                                  ),
                                  Obx(
                                    () => AnimatedFlipCounter(
                                      value:
                                          _controller.selectedCartPrice.value,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      thousandSeparator: ',',
                                      wholeDigits: 4,
                                      textStyle: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22,
                                          color: KurlyColors.black,
                                          height: 1.5),
                                    ),
                                  ),
                                  Text(
                                    '원',
                                    style: TextStyle(
                                        fontFamily: KurlyFontStyle.notoSansKR,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22),
                                  )
                                ])
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _controller.refreshCartResult();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: KurlyColors.blue100,
                                child: SizedBox(
                                    child: Icon(
                                  Icons.refresh,
                                  color: KurlyColors.white,
                                )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _controller.totalDays,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => Container(
                            margin: EdgeInsets.only(right: 10),
                            child: KurlyTextRadioButton(
                                onTap: () {
                                  _controller.selectedDay.value = index + 1;
                                },
                                textSize: 16,
                                borderRadius: 40,
                                height: 40,
                                width: 90,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                text: "${index + 1}일차",
                                unselectedBackgroundColor: KurlyColors.grey100,
                                unselectedTextColor: KurlyColors.grey200,
                                selectedValue: _controller.selectedDay.value,
                                value: index + 1),
                          ),
                        );
                      },
                      shrinkWrap: true,
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: Container(
                      width: KurlyWidth - 40,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: KurlyColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(22, 0, 0, 0),
                                blurRadius: 8,
                                spreadRadius: -1)
                          ]),
                      child: Obx(
                        () => Column(
                            children: _controller.dailyRecipeList[
                                    _controller.selectedDay.value - 1]
                                .map(
                                  (recipe) => RecipeItemWidget(
                                    imageUrl: recipe.thumbnail,
                                    level: recipe.difficulty,
                                    mealTime:
                                        _controller.mealTimeEnglishToKorean(
                                            mealTimeEng: recipe.mealTime),
                                    recipeName: recipe.recipeName,
                                  ),
                                )
                                .toList()),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: KurlyColors.white,
                  width: KurlyWidth,
                  child: Column(
                    children: _controller.ingredientList
                        .map((ingredient) => IngredientItemWidget(
                              ingredientName: ingredient.ingredientName,
                              price: decimalFormat.format(
                                  int.parse(ingredient.price) *
                                      ingredient.ingredientCount),
                              quantity: ingredient.ingredientCount,
                              imageUrl: ingredient.thumbnail,
                              onMinusTapped: () {
                                if (_controller.selectedIngredientList
                                    .contains(ingredient)) {
                                  if (ingredient.ingredientCount > 1) {
                                    ingredient.ingredientCount -= 1;
                                    _controller.selectedIngredientList
                                        .refresh();
                                  } else {
                                    showSnackbar(text: '재료는 1개 이상 담아야 해요');
                                  }
                                } else {
                                  showSnackbar(text: '재료를 담은 후에 수정해주세요');
                                }
                              },
                              onPlusTapped: () {
                                if (_controller.selectedIngredientList
                                    .contains(ingredient)) {
                                  if (ingredient.ingredientCount < 50) {
                                    ingredient.ingredientCount += 1;
                                    _controller.selectedIngredientList
                                        .refresh();
                                  } else {
                                    showSnackbar(text: '재료는 50개 이상 담을 수 없어요');
                                  }
                                } else {
                                  showSnackbar(text: '재료를 담은 후에 수정해주세요');
                                }
                              },
                              onRemoveTapped: () {
                                if (_controller
                                    .selectedIngredientList.isEmpty) {
                                  showSnackbar(text: '장바구니에 하나 이상의 재료가 있어야 해요');
                                } else {
                                  _controller.selectedIngredientList
                                      .remove(ingredient);
                                  _controller.selectedIngredientList.refresh();
                                }
                              },
                              onCheckTapped: () {
                                if (_controller.selectedIngredientList
                                    .contains(ingredient)) {
                                  _controller.selectedIngredientList
                                      .remove(ingredient);
                                } else {
                                  _controller.selectedIngredientList
                                      .add(ingredient);
                                }
                                _controller.ingredientList.refresh();
                              },
                              selected: _controller.selectedIngredientList
                                  .contains(ingredient),
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}

class RecipeItemWidget extends StatelessWidget {
  RecipeItemWidget(
      {Key? key,
      required this.recipeName,
      required this.mealTime,
      required this.level,
      required this.imageUrl})
      : super(key: key);

  String recipeName;
  String mealTime;
  String level;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 17, right: 15),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: KurlyWidth - 40,
      height: 72,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: KurlyColors.grey100,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
            ),
          ),
          Container(
            width: 195,
            padding: EdgeInsets.only(left: 13, bottom: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  recipeName,
                  style: TextStyle(
                      fontFamily: KurlyFontStyle.notoSansKR,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/meal.png',
                          width: 16,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          mealTime,
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              fontWeight: FontWeight.w400,
                              color: KurlyColors.grey200,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (level == '초급')
                            ? SvgPicture.asset(
                                'assets/icons/level1.svg',
                                height: 18,
                              )
                            : (level == '중급')
                                ? SvgPicture.asset(
                                    'assets/icons/level2.svg',
                                    height: 18,
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/level3.svg',
                                    height: 18,
                                  ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          level,
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              fontWeight: FontWeight.w400,
                              color: KurlyColors.grey200,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              'assets/icons/arrow_right.svg',
              color: KurlyColors.grey150,
              height: 17,
            ),
          ))
        ],
      ),
    );
  }
}

class IngredientItemWidget extends StatelessWidget {
  IngredientItemWidget(
      {Key? key,
      required this.ingredientName,
      required this.price,
      required this.quantity,
      required this.selected,
      this.onMinusTapped,
      this.onPlusTapped,
      this.onCheckTapped,
      this.onRemoveTapped,
      required this.imageUrl})
      : super(key: key);

  String ingredientName;
  String price;
  int quantity;
  String imageUrl;
  bool selected;
  void Function()? onCheckTapped;
  void Function()? onRemoveTapped;
  void Function()? onPlusTapped;
  void Function()? onMinusTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          width: KurlyWidth,
          height: 147,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.5, color: KurlyColors.grey100)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onCheckTapped,
                child: Container(
                    margin: EdgeInsets.only(right: 12, bottom: 20),
                    child: SvgPicture.asset(
                      'assets/icons/check.svg',
                      width: 25,
                      color: (selected)
                          ? KurlyColors.purple100
                          : KurlyColors.grey120,
                    )),
              ),
              Container(
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: KurlyColors.grey100,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 13,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          ingredientName,
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                price,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Text(
                                '원',
                                style: TextStyle(
                                    fontFamily: KurlyFontStyle.notoSansKR,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomStepper(
                          lowerLimit: 1,
                          upperLimit: 50,
                          stepValue: 1,
                          iconSize: 20,
                          onMinusTap: onMinusTapped,
                          onPlusTap: onPlusTapped,
                          value: quantity)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onRemoveTapped,
                child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 25, bottom: 20, right: 4),
                    child: SvgPicture.asset(
                      'assets/icons/remove.svg',
                      height: 20,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomStepper extends StatelessWidget {
  CustomStepper(
      {Key? key,
      required this.lowerLimit,
      required this.upperLimit,
      required this.stepValue,
      required this.iconSize,
      required this.value,
      this.onMinusTap,
      this.onPlusTap})
      : super(key: key);

  int lowerLimit;
  int upperLimit;
  int stepValue;
  double iconSize;
  int value;

  void Function()? onMinusTap;

  void Function()? onPlusTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: iconSize * 1.75,
      width: 95,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(227, 228, 228, 228),
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedIconButton(
            icon: Icons.remove,
            iconSize: iconSize,
            onPress: onMinusTap,
            iconColor: KurlyColors.grey120,
          ),
          SizedBox(
            width: iconSize,
            child: Text(
              value.toString(),
              style: GoogleFonts.openSans(
                  fontSize: 13, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          RoundedIconButton(
            icon: Icons.add,
            iconSize: iconSize,
            onPress: onPlusTap,
            iconColor: KurlyColors.grey200,
          ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {required this.icon,
      required this.onPress,
      required this.iconSize,
      required this.iconColor});

  IconData icon;
  void Function()? onPress;
  double iconSize;
  Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: iconSize * 1.3,
        height: iconSize * 1.5,
        color: Colors.white,
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize * 0.75,
        ),
      ),
    );
  }
}
