import 'package:flutter/material.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/appbar/appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KurlyAppBar(
          backgroundColor: KurlyColors.purple,
          title: '',
          leading: Container(
              margin: EdgeInsets.only(left: 1),
              child: Image.asset('assets/images/kurly.png')),
          leadingScale: 4,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '컬리와 당신의 장바구니',
                      style: TextStyle(
                          fontFamily: KurlyFontStyle.notoSansKR,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    ),
                    Text(
                      '내 예산과 취향에 맞는 레시피부터 재료까지',
                      style: TextStyle(
                          fontFamily: KurlyFontStyle.notoSansKR,
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                        height: 162,
                        child: Image.asset('assets/images/shopping_cart.png')),
                    SizedBox(height: 50),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
