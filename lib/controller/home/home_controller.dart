import 'package:get/get.dart';

enum PeopleAmount { one, two, three, four }

String peopleAmountToString(PeopleAmount peopleAmount) {
  switch (peopleAmount) {
    case PeopleAmount.one:
      return '1인';
    case PeopleAmount.two:
      return '2인';
    case PeopleAmount.three:
      return '3인';
    case PeopleAmount.four:
      return '4인';
    default:
      return '';
  }
}

class HomeController extends GetxController {
  Rxn<PeopleAmount> selectedPeopleAmount = Rxn<PeopleAmount>();
  List<PeopleAmount> peopleAmountList = [
    PeopleAmount.one,
    PeopleAmount.two,
    PeopleAmount.three,
    PeopleAmount.four
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
