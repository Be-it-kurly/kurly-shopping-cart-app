import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class KurlyTextRadioButton extends StatelessWidget {
  KurlyTextRadioButton(
      {Key? key,
      required this.text,
      this.selectedTextColor = KurlyColors.white,
      this.unselectedTextColor = KurlyColors.grey150,
      required this.selectedValue,
      this.onTap,
      required this.value,
      this.borderRadius = 5,
      this.height = 30,
      this.shadowColor = const Color.fromARGB(35, 0, 0, 0),
      this.textSize = 14,
      this.width = 57,
      this.unselectedBackgroundColor = KurlyColors.white,
      this.selectedBackgroundColor = KurlyColors.purple100,
      this.elevation = 4})
      : super(key: key);

  String text;
  Color selectedTextColor;
  Color unselectedTextColor;
  Color selectedBackgroundColor;
  Color unselectedBackgroundColor;
  dynamic selectedValue;
  dynamic value;
  double borderRadius;
  double width;
  double height;
  double textSize;
  Color shadowColor;
  void Function()? onTap;
  double elevation;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: (selectedValue == value)
            ? selectedBackgroundColor
            : unselectedBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        shadowColor: Color.fromARGB(90, 0, 0, 0),
        elevation: elevation,
        child: Ink(
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: height,
              child: Text(
                text,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    color: (selectedValue == value)
                        ? selectedTextColor
                        : unselectedTextColor,
                    fontSize: textSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
