import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/home/home_controller.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/appbar/appbar.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/button/wide_button.dart';

import '../../../routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KurlyAppBar(
          backgroundColor: KurlyColors.purple100,
          title: '',
          leading: Container(
              margin: EdgeInsets.only(left: 5, bottom: 1),
              child: Image.asset('assets/images/kurly.png')),
          leadingScale: 5,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                    Text(
                      '컬리와 당신의 장바구니',
                      style: TextStyle(
                          fontFamily: KurlyFontStyle.notoSansKR,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    Text(
                      '내 예산과 취향에 맞는 레시피부터 재료까지',
                      style: TextStyle(
                          fontFamily: KurlyFontStyle.notoSansKR,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    SizedBox(height: 50),
                    Container(
                        alignment: Alignment.center,
                        height: 162,
                        child: Image.asset('assets/images/shopping_cart.png')),
                    SizedBox(height: 50),
                    KurlyWideButtonWidget(
                        buttonText: '내 장바구니 담아보기',
                        onTap: () {
                          Get.toNamed(Routes.SHOPPING_CART_STEP1);
                        },
                        activeButtonColor: KurlyColors.purple100,
                        buttonWidth: KurlyWidth - 40,
                        active: true,
                        activeTextColor: KurlyColors.white),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: KurlyColors.grey100,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: KurlyWidth - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '당신의 일주일을 위한 장바구니 추천',
                      style: TextStyle(
                          fontFamily: KurlyFontStyle.notoSansKR,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Row(
                          children: _controller.peopleAmountList
                              .map(((peopleAmount) => Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: KurlyTextRadioButton(
                                        onTap: () {
                                          _controller.selectedPeopleAmount
                                              .value = peopleAmount;
                                        },
                                        text:
                                            peopleAmountToString(peopleAmount),
                                        selectedValue: _controller
                                            .selectedPeopleAmount.value,
                                        value: peopleAmount),
                                  )))
                              .toList()),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 15,
                      spacing: 15,
                      children: [
                        WeekItemWidget(),
                        WeekItemWidget(),
                        WeekItemWidget(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class WeekItemWidget extends StatelessWidget {
  const WeekItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (KurlyWidth - 40 - 15) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (KurlyWidth - 40 - 15) / 2,
            height: 190,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/vegan_food.png')),
                borderRadius: BorderRadius.circular(8)),
          ),
          Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              '일주일 비거니즘 도전!\n맛있는 채식 장바구니',
              style: TextStyle(
                  fontFamily: KurlyFontStyle.notoSansKR,
                  fontWeight: FontWeight.w400,
                  color: KurlyColors.black,
                  height: 1.3,
                  fontSize: 15),
            ),
          ),
          Text(
            '12,500원',
            style: TextStyle(
                fontFamily: KurlyFontStyle.notoSansKR,
                fontWeight: FontWeight.w700,
                color: KurlyColors.black,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class KurlyTextRadioButton extends StatelessWidget {
  KurlyTextRadioButton(
      {Key? key,
      required this.text,
      this.selectedTextColor = KurlyColors.white,
      this.unselectedTextColor = KurlyColors.grey150,
      required this.selectedValue,
      this.onTap,
      required this.value,
      this.unselectedBackgroundColor = KurlyColors.white,
      this.selectedBackgroundColor = KurlyColors.purple100})
      : super(key: key);

  String text;
  Color selectedTextColor;
  Color unselectedTextColor;
  Color selectedBackgroundColor;
  Color unselectedBackgroundColor;
  dynamic selectedValue;
  dynamic value;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(40, 0, 0, 0),
                  blurRadius: 7,
                  spreadRadius: 0)
            ],
            color: (selectedValue == value)
                ? selectedBackgroundColor
                : unselectedBackgroundColor,
            borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: 57,
            height: 30,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: KurlyFontStyle.notoSansKR,
                  fontWeight: FontWeight.w500,
                  color: (selectedValue == value)
                      ? selectedTextColor
                      : unselectedTextColor,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
