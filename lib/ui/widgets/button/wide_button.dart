import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';

class KurlyWideButtonWidget extends StatelessWidget {
  KurlyWideButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      this.inactiveButtonColor = KurlyColors.black,
      required this.activeButtonColor,
      required this.buttonWidth,
      this.buttonHeight = 50,
      required this.active,
      required this.activeTextColor,
      this.inactiveTextColor = KurlyColors.black})
      : super(key: key);
  String buttonText;
  double buttonHeight;
  double buttonWidth;
  Color inactiveButtonColor;
  Color activeButtonColor;
  Color inactiveTextColor;
  Color activeTextColor;
  void Function()? onTap;

  bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: Ink(
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
                color: (active) ? activeButtonColor : inactiveButtonColor),
            child: InkWell(
              onTap: (active) ? onTap : () {},
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      fontFamily: KurlyFontStyle.notoSansKR,
                      color: (active) ? activeTextColor : inactiveTextColor,
                      fontSize: 16,
                      height: 1,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
