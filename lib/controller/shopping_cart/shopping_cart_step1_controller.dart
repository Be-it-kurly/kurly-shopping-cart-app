import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';

import '../../ui/pages/shopping_cart/shopping_cart_1.dart';

class ShoppingCartStep1Controller extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxList<KeywordNode> nodeList = <KeywordNode>[].obs;
  late AnimationController animationController;
  List<String> keywordNodeList = [
    '매콤한',
    '영양가\n가득',
    '영양가\n가득',
    '영양가\n가득',
    '영양가\n가득',
    '영양가\n가득',
    '영양가\n가득',
    '영양가\n가득',
    '영양가\n가득',
    '영양가\n가득'
  ];

  List<dynamic> shakeAnimateList = [
    CustomShakeAnimated(),
    CustomShakeAnimated2(),
    CustomShakeAnimated3(),
    CustomShakeAnimated4(),
    CustomShakeAnimated5(),
    CustomShakeAnimated3(),
    CustomShakeAnimated2(),
    CustomShakeAnimated4(),
    CustomShakeAnimated(),
  ];

  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    nodeList.add(KeywordNode(
        text: "Canvas",
        top: 0.0,
        left: 0.0,
        radius: 0,
        shakeAnimation: CustomShakeAnimated(),
        active: false,
        keywordType: KeywordType.type1,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type1)));
    nodeList.add(KeywordNode(
        text: "Node\n1",
        top: 40.0,
        left: 0.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated(),
        active: false,
        keywordType: KeywordType.type1,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type1)));
    nodeList.add(KeywordNode(
        text: "Node\n2",
        top: 170.0,
        left: 40.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated3(),
        active: false,
        keywordType: KeywordType.type1,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type1)));

    nodeList.add(KeywordNode(
        text: "Node\n3",
        top: 80.0,
        left: 125.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated2(),
        active: false,
        keywordType: KeywordType.type1,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type1)));
    nodeList.add(KeywordNode(
        text: "Node\n4",
        top: 175.0,
        left: 220.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated4(),
        active: false,
        keywordType: KeywordType.type2,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type2)));
    nodeList.add(KeywordNode(
        text: "Node\n5",
        top: 48.0,
        left: 255.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated5(),
        active: false,
        keywordType: KeywordType.type2,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type2)));
    nodeList.add(KeywordNode(
        text: "Node\n6",
        top: 130.0,
        left: 355.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated2(),
        active: false,
        keywordType: KeywordType.type2,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type2)));
    nodeList.add(KeywordNode(
        text: "Node\n7",
        top: 40.0,
        left: 460.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated(),
        active: false,
        keywordType: KeywordType.type3,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type3)));
    nodeList.add(KeywordNode(
        text: "Node\n8",
        top: 170.0,
        left: 480.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated3(),
        active: false,
        keywordType: KeywordType.type3,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type3)));
    nodeList.add(KeywordNode(
        text: "Node\n9",
        top: 90.0,
        left: 585.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated4(),
        active: false,
        keywordType: KeywordType.type3,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.type3)));
  }

  @override
  void onReady() {
    super.onReady();
  }

  ColorSet getColorSetByKeyword({required KeywordType keywordType}) {
    switch (keywordType) {
      case KeywordType.type1:
        return ColorSet(
            inactiveBackgroundColor: KurlyColors.purple10,
            activeBackgroundColor: KurlyColors.purple100,
            activeTextColor: KurlyColors.white,
            inactiveTextColor: KurlyColors.purple50);

      case KeywordType.type2:
        return ColorSet(
            inactiveBackgroundColor: KurlyColors.blue10,
            activeBackgroundColor: KurlyColors.blue100,
            activeTextColor: KurlyColors.white,
            inactiveTextColor: KurlyColors.blue50);

      case KeywordType.type3:
        return ColorSet(
            inactiveBackgroundColor: KurlyColors.yellow10,
            activeBackgroundColor: KurlyColors.yellow100,
            activeTextColor: KurlyColors.white,
            inactiveTextColor: KurlyColors.yellow50);

      default:
        return ColorSet(
            inactiveBackgroundColor: KurlyColors.purple10,
            activeBackgroundColor: KurlyColors.purple100,
            activeTextColor: KurlyColors.white,
            inactiveTextColor: KurlyColors.purple50);
    }
  }

  changeNodesSettings(dynamic e) {}

  onKeywordClicked(int keywordNum) {
    if (nodeList[keywordNum].clickNum >= 2) {
      nodeList[keywordNum].clickNum = 0;
    } else if (nodeList[keywordNum].clickNum >= 0) {
      nodeList[keywordNum].clickNum++;
    }

    if (nodeList[keywordNum].clickNum == 1) {
      // nodeList[keywordNum].activeColor = KurlyColors.purple100;
      // nodeList[keywordNum].activeTextColor = KurlyColors.white;
      nodeList[keywordNum].active = true;
      nodeList[keywordNum].radius = 70;

      for (int i = keywordNum + 1; i < nodeList.length; i++) {
        //  if (nodeList[keywordNum].left +70<= nodeList[i].left){

        //  }
        nodeList[i].left += 20;
        if (nodeList[keywordNum].top < nodeList[i].top) {
          nodeList[i].top += 5;
        } else {
          nodeList[i].top -= 3;
        }
      }
    } else if (nodeList[keywordNum].clickNum == 2) {
      // nodeList[keywordNum].activeColor = KurlyColors.purple100;
      // nodeList[keywordNum].activeTextColor = KurlyColors.white;
      nodeList[keywordNum].active = true;
      nodeList[keywordNum].radius = 80;
      for (int i = keywordNum + 1; i < nodeList.length; i++) {
        nodeList[i].left += 15;
        if (nodeList[keywordNum].top < nodeList[i].top) {
          nodeList[i].top += 5;
        } else {
          nodeList[i].top -= 3;
        }
      }

      //   if (nodeList[keywordNum].top < nodeList[i].top &&
      // nodeList[keywordNum].top + 90 <= nodeList[i].top)
    } else {
      // nodeList[keywordNum].activeColor = KurlyColors.grey100;
      // nodeList[keywordNum].activeTextColor = KurlyColors.grey150;
      nodeList[keywordNum].active = false;
      nodeList[keywordNum].radius = 60;

      for (int i = keywordNum + 1; i < nodeList.length; i++) {
        nodeList[i].left -= 25;
        if (nodeList[keywordNum].top < nodeList[i].top) {
          nodeList[i].top -= 10;
        } else {
          nodeList[i].top += 3;
        }
      }
    }
    nodeList.refresh();
    update();
  }
}
