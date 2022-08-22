import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/shopping_cart/shopping_cart_step1_controller.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/theme/sizes.dart';
import 'package:kurly_shopping_cart_app/ui/theme/text_style.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/appbar/appbar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../routes/routes.dart';

class ShoppingCartStep1 extends StatelessWidget {
  ShoppingCartStep1({Key? key}) : super(key: key);
  ShoppingCartStep1Controller _controller =
      Get.put(ShoppingCartStep1Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KurlyAppBar(
        backgroundColor: KurlyColors.white,
        title: '',
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.SHOPPING_CART_STEP2);
          },
          backgroundColor: KurlyColors.purple100,
          child: Image.asset(
            'assets/icons/arrow_right.png',
            width: 27,
          )),
      body: Column(
        children: [
          Container(
            width: KurlyWidth,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 50,
                  size: 3,
                  padding: 0,
                  selectedColor: KurlyColors.purple100,
                  unselectedColor: KurlyColors.grey100,
                  roundedEdges: Radius.circular(10),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '지혜님이 좋아할만한\n장바구니 키워드를 골라봤어요',
                  style: TextStyle(
                      fontFamily: KurlyFontStyle.notoSansKR,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 30,
                ),
                // SingleChildScrollView(
                //   child: CustomPaint(
                //     painter: DraggablePainter(_controller.nodeList),
                //   ),
                // )
              ],
            ),
          ),
          Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 40),
                child: Stack(
                    alignment: Alignment.center,
                    children: _controller.nodeList
                        .map((e) => (e.text == 'Canvas')
                            ? SizedBox(
                                height: 500,
                                width: 1200,
                              )
                            : Positioned(
                                top: e.top,
                                left: e.left,
                                child: GestureDetector(
                                  onTap: () {
                                    _controller.onKeywordClicked(
                                        _controller.nodeList.indexOf(e));
                                  },
                                  child: ShakeWidget(
                                    autoPlay: true,
                                    shakeConstant: e.shakeAnimation,
                                    child: CircleAvatar(
                                      radius: e.radius,
                                      backgroundColor: (e.active)
                                          ? e.colorSet.activeBackgroundColor
                                          : e.colorSet.inactiveBackgroundColor,
                                      child: Text(
                                        e.text,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily:
                                                KurlyFontStyle.notoSansKR,
                                            fontWeight: FontWeight.w500,
                                            color: (e.active)
                                                ? e.colorSet.activeTextColor
                                                : e.colorSet.inactiveTextColor,
                                            fontSize: e.textSize),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                        .toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum KeywordType { type1, type2, type3 }

class KeywordNode {
  final String text;
  KeywordType keywordType;
  double top;
  double left;
  double radius;
  final dynamic shakeAnimation;
  bool active;
  double? textSize;
  int clickNum;
  ColorSet colorSet;
  KeywordNode({
    required this.keywordType,
    required this.text,
    required this.top,
    required this.left,
    required this.radius,
    required this.shakeAnimation,
    required this.active,
    required this.colorSet,
    this.textSize = 15,
    this.clickNum = 0,
  });
}

class ColorSet {
  Color inactiveBackgroundColor;
  Color activeBackgroundColor;
  Color activeTextColor;
  Color inactiveTextColor;

  ColorSet({
    required this.inactiveBackgroundColor,
    required this.activeBackgroundColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
  });
}

class CustomShakeAnimated implements ShakeConstant {
  @override
  List<int> get interval => [10];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [
        0,
        -1.5,
        -2.5,
        -0.5,
        0.5,
        -1.5,
        -1.5,
        -0.5,
        0.5,
        1.5,
        -2.5,
        -0.5,
        -0.5,
        0.5,
        3.5,
        1.5,
        -0.5,
        -0.5,
        0.5,
      ];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),
        Offset(1, 5),
        Offset(7, 4),
        // Offset(8, -2),
        // Offset(2, 10),
        Offset(3, 0),
        // Offset(5, 9),
        // Offset(4, 6),
        Offset(8, 2),
        // Offset(-1, -5),
        // Offset(-2, -5),
        // Offset(-4, -3),
        // Offset(-7, 5),
        // Offset(-7, 9),
        // Offset(-3, -2),
        // Offset(1, 2),
        // Offset(-6, -2),
        // Offset(-8, -1),
        // Offset(5, 10),
        // Offset(7, -9),
        // Offset(2, 0),
        // Offset(-7, 3),
        // Offset(-9, -4),
        // Offset(4, 9),
        // Offset(-7, 6),
        Offset(3, -3),
        Offset(1, -3),
        Offset(4, 3),
        Offset(9, 1),
        // Offset(-8, 3),
        // Offset(-8, -11),
        Offset(0, 0)
      ];
  @override
  Duration get duration => const Duration(milliseconds: 5000);
}

class CustomShakeAnimated2 implements ShakeConstant {
  @override
  List<int> get interval => [20];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [
        0,
        -1.5,
        -1.5,
        1.5,
        3.5,
        -0.5,
        -0.5,
        3.5,
        -0.5,
        -0.5,
        0.5,
        3.5,
        1.5,
        -0.5,
        0.5,
        1.5,
        -0.5,
        -0.5,
        0.5,
        -0.5,
        3.5,
        -2.5,
        0.5,
      ];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),

        // Offset(3, -3),
        // Offset(1, -3),

        // Offset(8, -2),
        // Offset(8, -2),

        Offset(3, 0),
        Offset(8, 9),
        Offset(9, 6),
        // Offset(-1, -5),
        // Offset(-2, -5),
        // Offset(-4, -3),
        // Offset(-7, 5),
        // Offset(-7, 9),
        // Offset(-3, -2),
        Offset(1, 2),

        Offset(1, 5),
        Offset(7, 4),

        Offset(7, -1),
        Offset(2, 0),
        // Offset(-7, 3),
        // Offset(-9, -4),
        // Offset(4, 9),

        // Offset(-7, 6),

        Offset(8, 7),

        Offset(0, 0)
      ];
  @override
  Duration get duration => const Duration(milliseconds: 5000);
}

class CustomShakeAnimated3 implements ShakeConstant {
  @override
  List<int> get interval => [20];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [
        0,
        -1.5,
        -1.5,
        1.5,
        3.5,
        1.5,
        -0.5,
        0.5,
        -0.5,
        1.5,
        -0.5,
        3.5,
        -0.5,
        3.5,
        -2.5,
        -0.5,
        -0.5,
        3.5,
        -0.5,
        -0.5,
        0.5,
        0.5,
        0.5,
      ];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),

        Offset(1, 0),

        // Offset(3, 0),
        // Offset(-8, 9),
        // Offset(-9, -6),
        Offset(1, 5),
        Offset(1, 2),
        Offset(4, 3),
        // Offset(-7, 5),
        Offset(7, 3),
        // Offset(-3, -2),
        // Offset(1, 2),

        Offset(1, 5),
        // Offset(7, 4),
        Offset(2, 0),
        // Offset(-7, 3),
        // Offset(-9, -4),
        Offset(4, 5),

        Offset(0, 6),

        // Offset(-8, -7),
        Offset(3, 1),
        Offset(7, 2),

        Offset(0, 0)
      ];
  @override
  Duration get duration => const Duration(milliseconds: 5000);
}

class CustomShakeAnimated4 implements ShakeConstant {
  @override
  List<int> get interval => [20];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [
        0,
        // -1.5,
        // -1.5,
        1.5,
        // 3.5,
        -0.5,
        -0.5,

        -0.5,
        -0.5,
        0.5,

        1.5,
        3.5,
        -0.5,

        -0.5, 3.5,
        -2.5,
        -0.5,
        0.5, 1.5,
        -0.5,
        0.5,
        3.5,
        0,
      ];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),

        // Offset(3, -3),
        // Offset(1, -3),

        Offset(8, 2),
        // Offset(8, -2),

        Offset(3, 0),

        Offset(9, 6),
        // Offset(-1, -5),
        Offset(2, 5),
        Offset(0, 7),

        // Offset(-4, -3),
        // Offset(-7, 5),
        // Offset(8, 9),
        // Offset(-7, 9),
        // Offset(-3, -2),
        // Offset(1, 2),

        // Offset(1, 5),
        // Offset(7, 4),

        Offset(7, 9),
        Offset(2, 0),
        // Offset(-7, 3),
        Offset(9, 4),
        // Offset(4, 9),

        // Offset(-7, 6),

        Offset(0, 0)
      ];
  @override
  Duration get duration => const Duration(milliseconds: 5000);
}

class CustomShakeAnimated5 implements ShakeConstant {
  @override
  List<int> get interval => [20];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [
        0,
        -1.5,
        -1.5,
        1.5,
        3.5,
        1.5,
        -0.5,
        0.5,
        -0.5,
        1.5,
        -0.5,
        3.5,
        -0.5,
        3.5,
        -2.5,
        -0.5,
        -0.5,
        3.5,
        -0.5,
        -0.5,
        0.5,
        0.5,
        0.5,
      ];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),

        // Offset(3, -3),
        // Offset(1, -3),

        // Offset(8, 2),

        Offset(3, 0),
        // Offset(-8, 9),
        // Offset(-9, -6),
        Offset(1, 5),
        // Offset(-2, -5),
        Offset(4, 3),
        // Offset(-7, 5),
        Offset(7, 9),
        // Offset(-3, -2),
        Offset(1, 2),

        Offset(1, 5),
        // Offset(7, 4),

        Offset(7, 2),
        Offset(2, 0),
        // Offset(-7, 3),
        // Offset(-9, -4),
        Offset(4, 9),

        // Offset(-7, 6),

        // Offset(-8, -7),

        Offset(0, 0)
      ];
  @override
  Duration get duration => const Duration(milliseconds: 5000);
}
