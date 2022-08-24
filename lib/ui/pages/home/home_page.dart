import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/home/home_controller.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/appbar/appbar.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/button/wide_button.dart';

import '../../../configs/constants/enum.dart';
import '../../../routes/routes.dart';
import '../../widgets/button/radio_button.dart';
import '../../widgets/item_widget/item_widget.dart';

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
          leadingScale: 2.5,
          leadingPadding:
              EdgeInsets.only(left: 10, bottom: 12, top: 8, right: 15),
          onLeadingTap: () {},
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
                      height: 25,
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
                      '${_controller.user.userName}님의 일주일을 위한 장바구니 추천',
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
                                            peopleAmountToKorean(peopleAmount),
                                        selectedValue: _controller
                                            .selectedPeopleAmount.value,
                                        unselectedBackgroundColor:
                                            KurlyColors.white,
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
                        KurlyItemWidget(
                          imageUrl: 'assets/images/vegan_food.png',
                          cartName: '일주일 비거니즘 도전!\n맛있는 채식 장바구니',
                          price: '56,500원',
                        ),
                        KurlyItemWidget(
                          imageUrl: 'assets/images/side_dish.png',
                          cartName: '동물복지 친환경 재료!\n환경을 위한 반찬 장바구니',
                          price: '47,000원',
                        ),
                        KurlyItemWidget(
                          imageUrl: 'assets/images/chicken_food.png',
                          cartName: '이국적인 맛을 좋아하는\n당신을 위한 장바구니',
                          price: '51,500원',
                        ),
                        KurlyItemWidget(
                          imageUrl: 'assets/images/indian_food.png',
                          cartName: '건강한 탄단지를 골고루!\n헬스인을 위한 장바구니',
                          price: '46,000원',
                        ),
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
