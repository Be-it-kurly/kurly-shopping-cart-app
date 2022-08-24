import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../configs/constants/enum.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_style.dart';

class UserSelectButton extends StatelessWidget {
  UserSelectButton({
    Key? key,
    required this.userName,
    required this.userGender,
    required this.userAge,
    required this.onTap,
  }) : super(key: key);

  String userName;
  int userAge;
  Gender userGender;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String imageSrc = '';
    (userGender == Gender.female)
        ? 'assets/images/female.png'
        : 'assets/images/male.png';
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          decoration: BoxDecoration(
              color: KurlyColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 6, spreadRadius: -1)
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: (userGender == Gender.female)
                    ? AssetImage('assets/images/female.png')
                    : AssetImage('assets/images/male.png'),
                backgroundColor: KurlyColors.grey120,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                            text: userName,
                            style: TextStyle(
                                fontFamily: KurlyFontStyle.notoSansKR,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                            children: [
                              TextSpan(
                                text: ' $userAge세',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              )
                            ]),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '구매패턴 보기',
                          style: TextStyle(
                              fontFamily: KurlyFontStyle.notoSansKR,
                              fontWeight: FontWeight.w400,
                              color: KurlyColors.grey200,
                              fontSize: 13),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: KurlyColors.black,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
