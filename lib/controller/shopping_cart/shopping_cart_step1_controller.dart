import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:kurly_shopping_cart_app/data/repository/keyword_repository.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'package:kurly_shopping_cart_app/ui/widgets/snackbar/snackbar.dart';
import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../../ui/pages/shopping_cart/shopping_cart_1_page.dart';
import '../auth_controller.dart';

class ShoppingCartStep1Controller extends GetxController
    with GetSingleTickerProviderStateMixin {
  final KeywordRepository _keywordRepository = KeywordRepository();
  final RxList<BubbleNode> nodeList = <BubbleNode>[].obs;
  late AnimationController animationController;
  ScrollController scrollController = ScrollController();
  RxInt currentStepValue = 10.obs;
  List<String> keywordTasteList = [];
  List<String> keywordCusineList = [];
  List<String> keywordFoodTypeList = [];
  Map<String, int> selectedKeywordMap = {};

  bool _keywordTasteSelected = false;
  bool _keywordCusineSelected = false;
  bool _keywordFoodTypeSelected = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    AuthController.to.updatePageView(isInit: 0);

    nodeList.add(BubbleNode(
        text: "Canvas",
        top: 0.0,
        left: 0.0,
        radius: 0,
        shakeAnimation: CustomShakeAnimated(),
        active: false,
        keywordType: KeywordType.taste,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.taste)));
    nodeList.add(BubbleNode(
        text: "",
        top: 40.0,
        left: 0.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated(),
        active: false,
        keywordType: KeywordType.taste,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.taste)));
    nodeList.add(BubbleNode(
        text: "",
        top: 170.0,
        left: 40.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated3(),
        active: false,
        keywordType: KeywordType.taste,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.taste)));

    nodeList.add(BubbleNode(
        text: "",
        top: 80.0,
        left: 125.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated2(),
        active: false,
        keywordType: KeywordType.taste,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.taste)));
    nodeList.add(BubbleNode(
        text: "",
        top: 175.0,
        left: 220.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated4(),
        active: false,
        keywordType: KeywordType.cusine,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.cusine)));
    nodeList.add(BubbleNode(
        text: "",
        top: 48.0,
        left: 255.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated5(),
        active: false,
        keywordType: KeywordType.cusine,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.cusine)));
    nodeList.add(BubbleNode(
        text: "",
        top: 130.0,
        left: 355.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated2(),
        active: false,
        keywordType: KeywordType.cusine,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.cusine)));
    nodeList.add(BubbleNode(
        text: "",
        top: 40.0,
        left: 460.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated(),
        active: false,
        keywordType: KeywordType.foodType,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.foodType)));
    nodeList.add(BubbleNode(
        text: "",
        top: 170.0,
        left: 480.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated3(),
        active: false,
        keywordType: KeywordType.foodType,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.foodType)));
    nodeList.add(BubbleNode(
        text: "",
        top: 90.0,
        left: 585.0,
        radius: 60,
        shakeAnimation: CustomShakeAnimated4(),
        active: false,
        keywordType: KeywordType.foodType,
        colorSet: getColorSetByKeyword(keywordType: KeywordType.foodType)));
    await _getUserKeywords();
    _assignUserKeywords();
  }

  _assignUserKeywords() {
    List<String> keywords = [
      ...keywordTasteList,
      ...keywordCusineList,
      ...keywordFoodTypeList
    ];
    print(keywords);

    for (int i = 0; i < keywords.length; i++) {
      nodeList[i + 1].text = keywords[i];
      print(nodeList[i].text);
    }
    nodeList.refresh();
  }

  _getUserKeywords() async {
    Either<Failure, Map<KeywordType, List<String>>> keywordMapEither =
        await _keywordRepository.getKeywordList();

    keywordMapEither.fold(
        (failure) => FailureInterpreter()
            .mapFailureToSnackbar(failure, '_getUserKeywords'), (keywordMap) {
      keywordTasteList.assignAll(keywordMap[KeywordType.taste] as List<String>);
      keywordCusineList
          .assignAll(keywordMap[KeywordType.cusine] as List<String>);
      keywordFoodTypeList
          .assignAll(keywordMap[KeywordType.foodType] as List<String>);
    });
  }

  isAllKeywordSelected() {
    _keywordTasteSelected = false;
    _keywordCusineSelected = false;
    _keywordFoodTypeSelected = false;
    for (var keywordNode in nodeList) {
      if (keywordNode.keywordType == KeywordType.taste &&
          keywordNode.weight > 0) {
        _keywordTasteSelected = true;
      } else if (keywordNode.keywordType == KeywordType.cusine &&
          keywordNode.weight > 0) {
        _keywordCusineSelected = true;
      } else if (keywordNode.keywordType == KeywordType.foodType &&
          keywordNode.weight > 0) {
        _keywordFoodTypeSelected = true;
      }
    }
    if (_keywordTasteSelected &&
        _keywordCusineSelected &&
        _keywordFoodTypeSelected) {
      return true;
    } else {
      return false;
    }
  }

  setCurrentStepValue() {
    if (isAllKeywordSelected()) {
      currentStepValue.value = 50;
    } else {
      currentStepValue.value = 10;
    }
  }

  ColorSet getColorSetByKeyword({required KeywordType keywordType}) {
    switch (keywordType) {
      case KeywordType.taste:
        return ColorSet(
            inactiveBackgroundColor: KurlyColors.purple10,
            activeBackgroundColor: KurlyColors.purple100,
            activeTextColor: KurlyColors.white,
            inactiveTextColor: KurlyColors.purple50);

      case KeywordType.cusine:
        return ColorSet(
            inactiveBackgroundColor: KurlyColors.blue10,
            activeBackgroundColor: KurlyColors.blue100,
            activeTextColor: KurlyColors.white,
            inactiveTextColor: KurlyColors.blue50);

      case KeywordType.foodType:
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

  moveToUnselectedKeywordZone() {
    if (!_keywordTasteSelected) {
      scrollController.animateTo(nodeList[1].left,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);

      showSnackbar(text: '맛 키워드를 선택해주세요');
    } else if (!_keywordCusineSelected) {
      scrollController.animateTo(nodeList[4].left,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);

      showSnackbar(text: '테마 키워드를 선택해주세요');
    } else if (!_keywordFoodTypeSelected) {
      scrollController.animateTo(nodeList[7].left,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);

      showSnackbar(text: '음식 종류 키워드를 선택해주세요');
    }
  }

  onKeywordClicked(int keywordNum) {
    if (nodeList[keywordNum].weight >= 2) {
      nodeList[keywordNum].weight = 0;
    } else if (nodeList[keywordNum].weight >= 0) {
      nodeList[keywordNum].weight++;
    }

    if (nodeList[keywordNum].weight == 1) {
      nodeList[keywordNum].active = true;
      nodeList[keywordNum].radius = 70;
      nodeList[keywordNum].textSize += 1;
      if (selectedKeywordMap.containsKey(nodeList[keywordNum].text)) {
        selectedKeywordMap.update(nodeList[keywordNum].text, (value) => 1);
      } else {
        selectedKeywordMap.addAll({nodeList[keywordNum].text: 1});
      }

      for (int i = keywordNum + 1; i < nodeList.length; i++) {
        //  if (nodeList[keywordNum].left +70<= nodeList[i].left){

        //  }

        if (keywordNum == 7 && i == 8) {
          nodeList[i].top += 13;
        }
        if (keywordNum == 5) {
          nodeList[4].top += 3;
          nodeList[6].top += 5;
        }

        if (keywordNum == 3) {
          nodeList[2].top += 2;
          nodeList[4].top += 2;
        }
        if (keywordNum == 4) {
          nodeList[i].left += 5;
        } else if (keywordNum == 9) {
          nodeList[i].left -= 5;
          nodeList[i].top -= 2;
        } else if (i == 9 && (keywordNum == 7 || keywordNum == 8)) {
          nodeList[9].left += 12;
          nodeList[9].top += 9;
        } else {
          nodeList[i].left += 15;
        }
      }
    } else if (nodeList[keywordNum].weight == 2) {
      nodeList[keywordNum].active = true;
      nodeList[keywordNum].radius = 80;
      nodeList[keywordNum].textSize += 1;

      if (selectedKeywordMap.containsKey(nodeList[keywordNum].text)) {
        selectedKeywordMap.update(nodeList[keywordNum].text, (value) => 2);
      } else {
        selectedKeywordMap.addAll({nodeList[keywordNum].text: 2});
      }

      for (int i = keywordNum + 1; i < nodeList.length; i++) {
        if (keywordNum == 1) {
          nodeList[2].top += 2;
        }
        if (keywordNum == 5) {
          nodeList[4].top += 3;
        }
        if (keywordNum == 3) {
          nodeList[2].top += 2;
          nodeList[4].top += 2;
        }

        if (keywordNum == 4) {
          nodeList[i].left += 5;
        } else if (keywordNum == 7 && i == 8) {
          nodeList[i].top += 20;

          nodeList[i].left += 10;
        } else if (keywordNum == 9) {
          nodeList[i].left -= 5;
          nodeList[i].top -= 2;
        } else if (i == 9 && (keywordNum == 7 || keywordNum == 8)) {
          nodeList[i].left += 15;
          nodeList[i].top += 9;
        } else {
          nodeList[i].left += 20;
        }
      }
    } else {
      nodeList[keywordNum].active = false;
      nodeList[keywordNum].radius = 60;
      nodeList[keywordNum].textSize -= 2;
      if (selectedKeywordMap.containsKey(nodeList[keywordNum].text)) {
        selectedKeywordMap.remove(nodeList[keywordNum].text);
      }

      for (int i = keywordNum + 1; i < nodeList.length; i++) {
        if (keywordNum == 1) {
          nodeList[2].top -= 2;
        }
        if (keywordNum == 7 && i == 8) {
          nodeList[i].top -= 30;
          nodeList[i].left -= 10;
        }
        if (keywordNum == 5) {
          nodeList[4].top -= 6;
          nodeList[6].top -= 5;
        }
        if (keywordNum == 3) {
          nodeList[2].top -= 4;
          nodeList[4].top -= 4;
        }
        if (keywordNum == 4) {
          nodeList[i].left -= 10;
        } else if (keywordNum == 9) {
          nodeList[i].left += 10;
          nodeList[i].top += 4;
        } else if (i == 9 && (keywordNum == 7 || keywordNum == 8)) {
          nodeList[9].left -= 27;
          nodeList[9].top -= 18;
        } else {
          nodeList[i].left -= 30;
        }
      }
    }
    nodeList.refresh();
  }
}
