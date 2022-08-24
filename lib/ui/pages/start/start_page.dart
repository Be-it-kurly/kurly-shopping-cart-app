// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/start/start_controller.dart';
import 'package:kurly_shopping_cart_app/ui/pages/start/start_widgets/user_selection_button.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import '../../../configs/constants/enum.dart';
import '../../theme/text_style.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);
  StartController _controller = Get.put(StartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KurlyColors.grey10,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text.rich(TextSpan(
                      text: "컬리",
                      style: TextStyle(
                          fontFamily: KurlyFontStyle.notoSansKR,
                          fontWeight: FontWeight.w600,
                          color: KurlyColors.purple100,
                          fontSize: 28),
                      children: [
                        TextSpan(
                          text: '와 ',
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              color: KurlyColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 27),
                        ),
                        TextSpan(
                          text: '당신',
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              color: KurlyColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        ),
                        TextSpan(
                          text: '의',
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              color: KurlyColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 27),
                        ),
                        TextSpan(
                          text: '\n장바구니',
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              color: KurlyColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        ),
                      ]))),
              SizedBox(
                height: 20,
              ),
              Stack(children: [
                SizedBox(
                  width: KurlyWidth + 30,
                  height: 210,
                ),
                Positioned(
                  right: -25,
                  child: Image.asset(
                    'assets/images/shopping_cart_no_shadow.png',
                    height: 200,
                  ),
                ),
              ]),
              SizedBox(
                height: 65,
              ),
              SizedBox(
                width: KurlyWidth - 40,
                height: 90,
                child: Row(
                  children: [
                    UserSelectButton(
                      userName: _controller.userList[0].userName,
                      userGender: Gender.female,
                      userAge: _controller.userList[0].age,
                      onTap: () {
                        _controller.setUserAndNextPage(userIndex: 0);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    UserSelectButton(
                      userName: _controller.userList[1].userName,
                      userGender: Gender.male,
                      userAge: _controller.userList[1].age,
                      onTap: () {
                        _controller.setUserAndNextPage(userIndex: 1);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 65,
                alignment: Alignment.center,
                child: FadeTransition(
                  opacity: _controller.animationColor,
                  child: Text(
                    '유저를 선택해주세요',
                    style: TextStyle(
                        fontFamily: KurlyFontStyle.notoSansKR,
                        color: KurlyColors.grey200,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
