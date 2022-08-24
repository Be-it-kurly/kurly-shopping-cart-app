import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../theme/colors.dart';
import '../../theme/text_style.dart';

showNumberPicker({required int initialValue}) async {
  return Get.defaultDialog(
      backgroundColor: Colors.white,
      title: '식사하는 인원수를\n선택해주세요',
      titlePadding: EdgeInsets.only(top: 30, bottom: 0),
      titleStyle: TextStyle(
          fontFamily: KurlyFontStyle.notoSansKR,
          fontWeight: FontWeight.w400,
          color: KurlyColors.black,
          fontSize: 18),
      content: SizedBox(
        height: 200,
        width: 100,
        child: NumberPicker(
          haptics: true,
          value: initialValue,
          minValue: 0,
          maxValue: 10,
          onChanged: (value) {
            initialValue = value;
          },
          textStyle: GoogleFonts.openSans(
              color: KurlyColors.grey150,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              height: 1.1),
          selectedTextStyle: GoogleFonts.openSans(
              color: KurlyColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 28,
              height: 1.1),
        ),
      ));
}
