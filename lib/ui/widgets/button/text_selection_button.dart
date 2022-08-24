import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/text_style.dart';

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
