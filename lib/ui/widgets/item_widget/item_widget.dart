import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/sizes.dart';
import '../../theme/text_style.dart';

class KurlyItemWidget extends StatelessWidget {
  KurlyItemWidget(
      {Key? key,
      required this.imageUrl,
      required this.cartName,
      required this.price})
      : super(key: key);

  String imageUrl;
  String cartName;
  String price;

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
                    fit: BoxFit.cover, image: AssetImage(imageUrl)),
                borderRadius: BorderRadius.circular(8)),
          ),
          Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              cartName,
              style: TextStyle(
                  fontFamily: KurlyFontStyle.notoSansKR,
                  fontWeight: FontWeight.w400,
                  color: KurlyColors.black,
                  height: 1.3,
                  fontSize: 15),
            ),
          ),
          Text(
            price,
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
