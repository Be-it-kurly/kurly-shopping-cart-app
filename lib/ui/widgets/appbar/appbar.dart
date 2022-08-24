import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';

import '../../theme/colors.dart';

class KurlyAppBar extends StatelessWidget with PreferredSizeWidget {
  KurlyAppBar({
    Key? key,
    required this.title,
    this.action,
    this.leading,
    this.onActionTap,
    this.onLeadingTap,
    this.backgroundColor,
    this.leadingScale,
    this.leadingPadding,
  }) : super(key: key);

  String title;
  Widget? leading;
  Widget? action;
  void Function()? onActionTap;
  void Function()? onLeadingTap;
  Color? backgroundColor;
  double? leadingScale;
  EdgeInsetsGeometry? leadingPadding;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        scrolledUnderElevation: 5,
        shadowColor: Color.fromARGB(34, 0, 0, 0),
        elevation: 0,
        backgroundColor: backgroundColor ?? KurlyColors.purple100,
        title: Text(
          title,
          style: TextStyle(fontFamily: KurlyFontStyle.notoSansKR),
        ),
        actions: [
          GestureDetector(
            onTap: onActionTap,
            child: Transform.scale(
              scale: 0.98,
              child: Container(
                  color: backgroundColor ?? KurlyColors.purple100,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: action),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: onLeadingTap ??
              () {
                Get.back();
              },
          child: Transform.scale(
            scale: leadingScale ?? 1.8,
            child: Container(
                color: backgroundColor ?? KurlyColors.purple100,
                alignment: Alignment.centerRight,
                padding: leadingPadding ??
                    EdgeInsets.only(left: 10, right: 24, bottom: 10, top: 10),
                child: leading ??
                    SvgPicture.asset(
                      'assets/icons/arrow_left.svg',
                      color: KurlyColors.black,
                    )),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight - 25);
}
